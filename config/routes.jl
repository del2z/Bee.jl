using Genie.Router
using ClassifyController

route("/") do
  serve_static_file("/welcome.html")
end

route("/classify", ClassifyController.show)
route("/classify/anno", ClassifyController.anno)
route("/classify/submit", ClassifyController.submit, method = POST, named = :show_label)

