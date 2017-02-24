#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "fptcorrea@gmail.com"
git config --global user.name "azeloc"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
git rm -rf
cp -r ../_book/* ./
git add --all *
git commit -m "Atualiza a apostila" || true
git push -q origin gh-pages
