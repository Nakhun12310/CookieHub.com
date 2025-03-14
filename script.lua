local http = require("socket.http")
local url = "http://example.com"
local response, status = http.request(url)
if status == 200 then
    print(response)
else
    print("Error:", status)
end
