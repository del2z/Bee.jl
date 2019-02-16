using Genie.Router
using IndexController
using ClassifyController

route("/", IndexController.index)
route("/index", IndexController.index)

route("/classify", ClassifyController.show)
route("/classify/anno", ClassifyController.anno)
route("/classify/submit", ClassifyController.submit, method = POST, named = :show_label)

