import requests

print(requests.get('https://rdb.altlinux.org/api/version').json()['version'])
