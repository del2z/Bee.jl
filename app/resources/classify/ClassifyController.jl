#!/usr/bin/env julia
# del2z <delta.z@aliyun.com>

module ClassifyController

using Genie.Renderer
using Genie.Router
import LabelSet: Labels

function show()
    html!(:classify, :show, labelset = Labels)
end

function anno()
    html!(:classify, :anno, labelset = Labels)
end

function submit()
    @params(:label) |> println
    redirect_to(:get_classify)
end

end
