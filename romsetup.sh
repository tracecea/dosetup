#check if iam root
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root"
  exit
fi

#remove any open jdk instances
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*

#installing essential packages
apt-get update
apt-get upgrade
apt-get install --assume-yes openjdk-8-jdk
apt-get --assume-yes install bison build-essential curl flex git git-core gnupg gperf libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk2.8-dev libxml2 libxml2-utils lzop openjdk-7-jdk openjdk-7-jre pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev unzip lib32readline-gplv2-dev lib32z1-dev make python-networkx phablet-tools

#setting up environments
mkdir -p ~/bin
cd ~/bin

#setting up repo
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

echo "export PATH=~/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

#configuring git
read -p "Please enter your name for git: " git_name
read -p "Please enter your email for git: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"
