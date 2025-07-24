#!/bin/sh
docker run -d --rm -it -v $(pwd):/Troupe/playground --name troupe-playground troupe-master
