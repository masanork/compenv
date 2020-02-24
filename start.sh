#!/bin/sh
docker run -it -p 8888:8888 --rm --name compenv1 --mount type=bind,src=`pwd`/workdir,dst=/workdir masanork/compenv
