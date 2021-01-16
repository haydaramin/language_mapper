curl -sSL https://get.rvm.io | bash
rvm install jruby
gem install bundle
bundle install
wget http://resources.mpi-inf.mpg.de/yago-naga/uwn/uwnapi.zip
wget http://resources.mpi-inf.mpg.de/yago-naga/uwn/wordnet.zip
wget http://resources.mpi-inf.mpg.de/yago-naga/uwn/uwn.zip
wget http://resources.mpi-inf.mpg.de/yago-naga/uwn/etymwn.zip
if ! unzip -v &>/dev/null; then
  echo "unzip could not be found, installing now"
  if apt-get -v &>/dev/null; then
    sudo apt-get install unzip
  else
    brew install unzip
  fi
fi
unzip uwnapi.zip wordnet.zip uwn.zip etymwn.zip
rm *.zip
mv wordnet/* uwnapi/plugins
mv uwn/* uwnapi/plugins
mv etymwn/* uwnapi/plugins
rm -rf wordnet uwn etymwn
