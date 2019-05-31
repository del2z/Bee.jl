using Genie.Router
using IndexController
using ClassifyController

route("/", IndexController.index)
route("/index", IndexController.index)

route("/classify", ClassifyController.anno)
route("/classify/submit", ClassifyController.submit, method = POST, named = :submit_classify)
# route("/classify/save", ClassifyController.save, method = POST, named = :save_classify)

