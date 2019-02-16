#!/usr/bin/env julia
# del2z <delta.z@aliyun.com>

module IndexController

using Genie.Renderer
using Genie.Router

function index()
    html!(:index, :index)
end

end
