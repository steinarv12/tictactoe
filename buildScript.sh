echo Cleaning...
rm -rf ./dist

ln -s /usr/bin/nodejs /usr/bin/node

echo "Installing npm..."
sudo apt-get install npm

echo "Installing grunt cli"
sudo npm install grunt-cli -g

echo "Installing grunt"
npm install grunt

echo "Installing bower"
sudo npm install bower -g

echo "Npm install"
npm install

echo "Bower install"
bower install


echo "Running grunt"
grunt

cp ./Dockerfile ./dist/

cd dist

echo "Npm install production..."
npm install --production

echo "Building docker image..."
docker build -t steinarv12/tictactoe .

echo "Pushing docker image..."
docker push steinarv12/tictactoe

echo "Done"
