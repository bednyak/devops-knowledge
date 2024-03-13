```
sudo apt-get install letsencrypt
```

```
sudo certbot certonly --manual \
--preferred-challenges=dns \
--email vertexpj@computools.com \
--server https://acme-v02.api.letsencrypt.org/directory \
--agree-tos \
--manual-public-ip-logging-ok \
-d "*.qa.test.com"
```

```
sudo certbot certonly --manual \
--preferred-challenges=dns \
--email assadrizk@gmail.com \
--server https://acme-v02.api.letsencrypt.org/directory \
--agree-tos \
--manual-public-ip-logging-ok \
-d "test.com"
```