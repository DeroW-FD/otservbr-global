#!/bin/sh

set -o errexit # abort on nonzero exitstatus
set -o nounset # abort on unbound variable

export DEBIAN_FRONTEND=noninteractive

ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

apt-get update
apt-get install -y \
	apache2 \
	build-essential \
	ca-certificates \
	ccache \
	cmake \
	curl \
	git \
	libapache2-mod-php \
	libluajit-5.1-dev \
	mariadb-server mariadb-client \
	php \
	php-mysql \
	phpmyadmin \
	pkg-config \
	tar \
	unzip \
	zip

dpkg-reconfigure --frontend noninteractive tzdata

git clone https://github.com/microsoft/vcpkg
cd vcpkg
./bootstrap-vcpkg.sh

cd otservbr-global
mkdir -p build && cd build
cmake -DCMAKE_TOOLCHAIN_FILE=$HOME/vcpkg/scripts/buildsystems/vcpkg.cmake ..
make -j`nproc`
mv bin/otbr ../

cd ..
unzip -o data/world/world.zip -d data/world/

cp config.lua.dist config.lua
sed -i '/ip = .*$/c\ip = "'"$PROXY_IP"'"' config.lua
sed -i '/motd = .*$/c\motd = "Test Server' config.lua
sed -i '/mysqlHost = .*$/c\mysqlHost = "127.0.0.1"' config.lua
sed -i '/mysqlUser = .*$/c\mysqlUser = "otserver"' config.lua
sed -i '/mysqlPass = .*$/c\mysqlPass = "otserver"' config.lua
sed -i '/mysqlDatabase = .*$/c\mysqlDatabase = "otserver"' config.lua
sed -i '/onePlayerOnlinePerAccount = .*$/c\onePlayerOnlinePerAccount = false' config.lua


# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$DB_PASSWORD') WHERE User = 'root'"
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE test"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
