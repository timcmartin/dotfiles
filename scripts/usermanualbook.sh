#!/usr/bin/env bash

# Push main
git checkout main

git push --force origin

# Rebase gitbook
git checkout gh-pages

git rebase main

mdbook build --dest-dir ./docs

git add .

git ci -m "Building book."

git push --force origin

git checkout main
