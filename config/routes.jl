using Genie.Router
using ClassifyController

route("/") do
  serve_static_file("/welcome.html")
end

route("/bgbooks", ClassifyController.billgatesbooks)
route("/bgbooks/new", ClassifyController.new)
route("/bgbooks/create", ClassifyController.create, method = POST, named = :create_book)

