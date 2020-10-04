#!/bin/bash
echo "Credits to 17lwinn (ProTechCEO) for the original, glitch-cli"
#glitcx.sh - manage glitch projects
#add: -safe-npm -safe-pip -scan
#sed 's/$1=$2//' .env
if [[ $1 == "-env-add" ]] ; then
  echo "$2=$3" >> .env
  refresh
elif [[ $1 == "-env-del" ]] ; then
  sed 's/$2=$3//' .env
elif [[ $1 == "-zip-it" ]] ; then
  zip -r your_zip_file.zip /app/* /app
  refresh
elif [[ $1 == "-git-clone" ]] ; then
  git clone $2
elif [[ $1 == "-glitcx-commandline" ]] ; then
  clear
  echo -e "\e[1;41m welcome to the glitcx command line - ctrl C to exit \e[0m"
  while :
  do 
  echo -e "\e[1;41m $(pwd) \e[0m"
  read h
  $h
  done
elif [[ $1 == "-edit" ]] ; then
  echo -e "\e[1;41m editing "$2" \e[0m"
  echo -e "\e[1;41m ctrl C to exit \e[0m"
  cat > $2
elif [[ $1 == "-clone-folder" ]] ; then
  cd ..
  wget $2
  rmdir app
  mv $3 "app"
  refresh
elif [[ $1 == "-git-clone-app" ]] ; then
  cd .. && git clone $2/$3 && rm -r app && mv $3 app && refresh # oneliner github import
elif [[ $1 == "-nodify" ]] ; then
  mkdir /tmp/app
  cp -r /app/* /tmp/app/
  rm -rf /app/*
  mkdir /app/public
  cp -r /tmp/app/* /app/public
  rm -rf /tmp/app
  cd /app
  curl https://glitcxcli.glitch.me/default-node.tar.bz2 | tar xjf -x
  #original from  nodify.glitch.me/default-node.tar.bz2
  refresh
elif [[ $1 == "-restart" ]] ; then
  echo 'sure? close if not.';
  read var
  cd /app/ && rm *
  refresh
elif [[ $1 == "-uninstall" ]] ; then
  echo 'sure? close if not. will also delete .bash_profile';
  read var
  rm -.bash_profile
  rm -glitcx.sh
  refresh
elif [[ $1 == "-secure-npm" ]] ; then
  npm install $2
  npm audit fix
elif [[ $1 == "-help" ]] ; then
  echo '-clone_link link foldername imports from a folder';
  echo '-edit file                  the worst shell editor';
  echo '-env-del variable value     delete value from .env';
  echo '-env-add variable value     add value to .env';
  echo '-git-clone user/repo/path   clone with deleting project from here';
  echo '-git-clone-app user repo    delete project, import from github';
  echo '-glitcx-commandline         enter glitcx command line';
  echo '-help                       show this help message';
  echo '-nodify                     nodify project';
  echo '-restart                    delete all contents in app';
  echo '-uninstall                  uninstall glitcx cli';
  echo '-zip-it                     zip this project';
  echo 'Package managers (dont work yet)'
  echo '-secure-npm package         securely install from NPM'
  echo '-secure-pip package         securely install from PIP'
fi
