import json
received_body = '{"cities":["南京"]}'
received_body = json.loads(received_body)
print(received_body)