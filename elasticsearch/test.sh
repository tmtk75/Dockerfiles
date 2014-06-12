rand=$(ruby -e 'print rand')
now=$(date)
body=$(cat<<EOF
{"name":"${now}", "rand":"${rand}"}
EOF
)
curl -v -XPOST localhost:9200/test/name-and-rand -d "$body"
