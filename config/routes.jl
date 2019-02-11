using Genie.Router
using ClassifyController

route("/") do
  serve_static_file("/welcome.html")
end

route("/bgbooks", ClassifyController.billgatesbooks)

