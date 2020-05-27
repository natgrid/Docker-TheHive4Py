d=$(date +%s%N | cut -b1-13)
e=$[d - 86400000]
curl -XPOST  -H 'Content-Type: application/json' -H 'Authorization: Bearer API' http://192.168.1.87:9000/api/case/_search -d "{
   \"query\":{     \"_gt\": {
      \"createdAt\": \"$e\"
    }
}}"
