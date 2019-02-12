#!/usr/bin/env julia
# del2z <delta.z@aliyun.com>

module LabelSet

using CSV
using DataFrames
using DataStructures

function load(fname::AbstractString)
    df = CSV.read(fname, delim = ",")
    filter(s -> !startswith(s, "#"), df[1])
end

Labels = collect(OrderedDict(enumerate(load("/bank/Workspace/Projects/NLP-JL/Bee/data/class_list.txt"))))

end
