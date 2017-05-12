#!/bin/bash


if [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH = "master" ]]
  then

  # Get SSH key
  mkdir .travis
  openssl aes-256-cbc -K $encrypted_4a2ac5ed3748_key -iv $encrypted_4a2ac5ed3748_iv\
    -in .travis/deploy.key.enc -out .travis/deploy.key -d

  # Setup ssh agent
  eval "$(ssh-agent -s)" #start the ssh agent
  chmod 600 .travis/deploy.key # this key should have push access
  ssh-add .travis/deploy.key

  # cleanup
  rm -rf gh-pages

  git clone -b gh-pages ${GH_REF} gh-pages

  if [[ $RESET == "true" ]]
  then
    rm -rf gh-pages/*
  fi

  # copy generated HTML site to built branch
  cp -R _site/* gh-pages

  # commit and push generated content to built branch
  # since repository was cloned in write mode with token auth - we can push there
  cd gh-pages
  git config user.email "webmaster@nottinghamsrn.co.uk"
  git config user.name "srnbot"
  git add -A .
  git commit -a -m "Travis Build $TRAVIS_BUILD_NUMBER for $TRAVIS_COMMIT"
  git push --quiet origin gh-pages > /dev/null 2>&1 # Hiding all the output from git push command, to prevent token leak.
fi
