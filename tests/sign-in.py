import requests
import json

url = 'http://localhost:3003/v2/sign-in/'
body = {
    "phoneNumber": "989121115050"
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
assert "authID" in obj["result"]
# assert "verifyCode" in obj["result"]

# {
#     "status": 1,
#     "alert": {
#         "has": 1,
#         "hide": 1,
#         "title": "فعال سازی حساب",
#         "message": "کد فعال سازی برای شماره موبایل شما ارسال می شود."
#     },
#     "result": {
#         "authID": "79009322-59c3-45a6-b0da-c30632e97331",
#         "verifyCode": 3775
#     }
# }
