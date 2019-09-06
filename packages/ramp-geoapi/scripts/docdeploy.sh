#!/bin/bash

set -e

if [ "$TRAVIS_REPO_SLUG" == "fgpv-vpgf/geoApi" ] && [ -n "$TRAVIS_TAG" ]; then
    npm run doc

    openssl aes-256-cbc -k "$PW" -out ~/.ssh/id_rsa -in devkey.enc -d
    echo -e "Host *\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
    chmod 600 ~/.ssh/id_rsa
    eval `ssh-agent -s`
    ssh-add ~/.ssh/id_rsa

    git clone --depth=1 git@github.com:fgpv-vpgf/geoApi.git -b gh-pages ghdocs
    ls ghdocs
    mkdir -p ghdocs/$TRAVIS_TAG
    rsync -av --delete docbuild/ ghdocs/$TRAVIS_TAG/
    bash ./scripts/make_doc_index.sh ghdocs/ > ghdocs/index.html

    cd ghdocs
    git add $TRAVIS_TAG
    git add index.html
    git config user.email "glitch.chatbot@gmail.com"
    git config user.name "Glitch Bot"
    git commit -m "Docs for geoApi@$TRAVIS_TAG"
    git push
    cd ..
    rm -rf ghdocs
fi
