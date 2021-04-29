#!/bin/sh

setup_git() {
  git config --global user.email "yejisoft@gmail.com"
  git config --global user.name "Hong Yeji"
  git config credential.helper "store --file=.git/credentials"
  echo "https://${GH_TOKEN}:@github.com" > .git/credentials
  cat .git/credentials
}

commit_website_files() {
  git checkout -b deploy
  mkdir packages && mv ../*.deb packages/
  git add packages/*
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote -v
  git remote add new https://${GH_TOKEN}:@github.com/yeji0407/test.git > /dev/null 2>&1
  git push --quiet --set-upstream new deploy
}

setup_git
commit_website_files
upload_files
