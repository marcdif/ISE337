require 'net/http'
require 'uri'

h = Net::HTTP.get_response(URI("http://localhost:5000/test/"))
resp,data = h.message, h.body
if resp == "OK"
  data.scan(/<p id="(.*?)"/) { |x| puts x }
end
