Digitalocean
========

get token
------

1. export TOKEN

`export DO_TOKEN="xxx"`

2. get

`curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/images?type=distribution" | prettyjson > images_dist.txt`

ssh key
------

1. export TOKEN

`export DO_TOKEN="xxx"`

2. get

`curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/account/keys"
`
