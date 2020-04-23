#!/bin/bash

print() {
  echo ">>> $1"
}

print "go to folder $1"
cd $1
print "searching git repositories"
for repo in $(find "$1" -type d -name ".git"); do

  print "committing repository $repo"
  cd "$repo"
  cd ..
  statusgit=$(git status)
  if [[ $statusgit != *"Tu rama está actualizada"* ]]; then
    print "auto committing"
    git commit -am "auto-commit by shell script git-utils"
  fi

  git push origin

done
