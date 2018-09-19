# required environment variables

+ DNSIMPLE_ACCOUNT
+ DNSIMPLE_TOKEN
+ HEROKU_API_KEY
+ HEROKU_EMAIL
+ TF_VAR_name

# run

```
DNSIMPLE_ACCOUNT=$(vault read sec/int/dnsimple | jq -r '.data.account') DNSIMPLE_TOKEN=$(vault read sec/int/dnsimple | jq -r '.data.token') HEROKU_API_KEY=$(heroku auth:token) HEROKU_EMAIL="infrastruktur@tv4.se" TF_VAR_name="" terraform plan/apply
```
