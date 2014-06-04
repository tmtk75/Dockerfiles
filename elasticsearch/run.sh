#!/usr/bin/env bash
version="1.2.0"
for e in `seq 0 10`; do
  name=n$e
  if [ -e $name ]; then
    continue
  fi
  if [ $e == 0 ]; then
    port_opt="-p 9200:9200"
  fi
  echo "data dirname: $name"
  docker run -v `pwd`/$name:/elasticsearch-$version/data \
    $port_opt $* elasticsearch:$version
  exit 0
done
