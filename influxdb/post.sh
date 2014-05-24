#!/usr/bin/env bash

dbname=test

for i in `seq 100 120`; do

t=$((1400425947368 + $i))
v=$((1400425947368 + $i * 10))

body=$(cat<<EOF
[
  {
    "name": "ts",
    "columns": ["time", "v", "desc"],
    "points": [
      [$t, $i, "this line is of $i"],
      [$t, $v, "desc of $v"]
    ]
  }
]
EOF)

curl -XPOST "localhost:8086/db/$dbname/series?u=root&p=root" \
  -d "$body"

done

