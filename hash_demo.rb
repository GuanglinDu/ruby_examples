h1 = {name: "Tom", text: "hello", children: []}
h1["lan_name"] = "Legacy LAN"
puts h1["lan_name"]
puts h1

# undefined method `push' for nil:NilClass (NoMethodError)
#h1["children"].push({name: "Jerry", text: "hi"}) # String as the key is not allowed
h1[:children].push({name: "Jerry", text: "hi"})      # only Symbol as the key
puts h1
