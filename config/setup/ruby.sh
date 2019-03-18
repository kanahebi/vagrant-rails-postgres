sudo yum -y install \
  gcc gcc-c++ glibc-headers \
  openssl-devel readline libyaml-devel readline-devel zlib zlib-devel \
  wget git ImageMagick ImageMagick-devel

for i in $(seq 1 3)
do
  curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
  if [ $? -eq 0 ]; then
    break
  fi
  sleep 5s
done

\curl -sSL https://get.rvm.io | bash -s stable
if [ `whoami` = root ]; then
  RVM_HOME=/usr/local/rvm
else
  RVM_HOME=$HOME/.rvm
fi
export PATH="$PATH:$RVM_HOME/bin"
source $RVM_HOME/scripts/rvm
rvm install 2.6
rvm use 2.6 --default
gem install bundler
