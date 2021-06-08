import requests
import json

url = 'http://localhost:3003/v2/guest/'
body = {
}
headers = {
	'content-type': 'application/json',
}

print(json.dumps(body))
r = requests.post(url, data=json.dumps(body), headers=headers)
print(r)
assert r.status_code == 200

obj = r.json()
print(obj)

# Tests
assert obj["status"] == 1

assert "alert" in obj
assert "has" in obj["alert"]

assert "result" in obj
assert "sessionID" in obj["result"]
assert "authID" in obj["result"]
assert "datetime" in obj["result"]

# {
#     "status": 1,
#     "alert": {
#         "has": 1,
#         "hide": 1,
#         "title": "میرسه",
#         "message": "مهمان گرامی خوش آمدید."
#     },
#     "result": {
#         "authID": "67adae36-7752-4c04-83bc-a5b50c2d5122",
#         "sessionID": "67adae36-7752-4c04-83bc-a5b50c2d5122",
#         "datetime": 1623108730
#     }
# }
