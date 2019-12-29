#!/bin/sh -l
/usr/local/bin/pandoc-book.rb ${GITHUB_REPOSITORY}
echo "Compressing"
zip books.zip build/*
echo "Releasing"
/usr/local/bin/upload-to-release.sh books.zip application/zip
