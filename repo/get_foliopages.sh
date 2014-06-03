#!/usr/bin/env bash

wget http://www.foliopages.com/downloads/foliogallery-master-1.3.zip -O /tmp/foliogallery-master-1.3.zip

cd repo; mkdir -p foliogalery; cd  foliogalery; unzip -o /tmp/foliogallery-master-1.3.zip 
mkdir -p repo/foliogalery/foliogalery-master
cd repo/foliogalery/foliogalery-master
unzip -o /tmp/foliogallery-master-1.3.zip
