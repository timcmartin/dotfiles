#!/usr/bin/env bash

# Push main
git checkout main

git push --force origin

# Currently repository is duplicated to main timcmartin.github.io
git push --force book

# Rebase gitbook
git checkout gh-pages

git rebase main

mdbook build --dest-dir ./docs

git add .

git ci -m "Building book."

git push --force origin

git push --force book

git checkout main
