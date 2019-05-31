#!/usr/bin/env julia
# del2z <delta.z@aliyun.com>

module ClassifyController

using Genie.Renderer
using Genie.Router
using ClassifyModel

function anno()
    query = ClassifyModel.getquery(ClassifyModel.DataSet)
    if query === nothing
        ClassifyModel.dumpdata(ClassifyModel.DataSet)
        redirect_to(:get)
    else
        html!(:classify, :anno, query = "Q: " * query, labelset = ClassifyModel.Labels)
    end
end

function submit()
    @params(:label) |> println
    # ClassifyModel.update!(ClassifyModel.DataSet, ClassifyModel.Labels)
    ClassifyModel.update!(ClassifyModel.DataSet, @params(:label))
    redirect_to(:get_classify)
end

function save()
    ClassifyModel.dumpdata(ClassifyModel.DataSet)
    redirect_to(:get)
end

end
