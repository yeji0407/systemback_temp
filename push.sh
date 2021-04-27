#!/bin/sh

setup_git() {
  git config --global user.email "yejisoft@gmail.com"
  git config --global user.name "Hong Yeji"
}

commit_website_files() {
  git checkout -b deploy
  git add . *.deb
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add new https://${GH_TOKEN}@github.com/yeji0407/systemback_temp.git > /dev/null 2>&1
  git push --quiet --set-upstream new deploy
}

setup_git
commit_website_files
upload_files