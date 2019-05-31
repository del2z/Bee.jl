#!/usr/bin/env julia
# del2z <delta.z@aliyun.com>

module ClassifyModel

using CSV
using DataFrames
using DataStructures

function loadlabel(fname::AbstractString)
    df = CSV.read(fname, delim = ",", header = 0)
    list = filter(s -> !startswith(coalesce(s, "#"), "#"), df[1])
    OrderedDict(enumerate(list))
end

Labels = collect(loadlabel("data/class_list.txt"))

mutable struct ClassifyData
    queries::Vector{String}
    labels::Vector{String}
    size::Integer
    offset::Integer
    ClassifyData(queryset::Vector{String}) = new(queryset, fill("", size(queryset, 1)), size(queryset, 1), 0)
    function ClassifyData(queryset::Vector{String}, labelset::Vector{String})
        @assert size(queryset, 1) >= size(labelset, 1)
        new(queryset, vcat(labelset, fill("", size(queryset, 1) - size(labelset, 1))),
            size(queryset, 1), size(labelset, 1))
    end
end

function getquery(data::ClassifyData)
    (data.offset < data.size) ? data.queries[data.offset + 1] : nothing
end

function update!(data::ClassifyData, label::AbstractString)
    data.offset += 1
    data.labels[data.offset] = label
end

function loadquery(fquery::AbstractString, fcache::AbstractString = "")
    dfq = CSV.read(fquery, delim = ",", header = 0)
    queryset = collect(skipmissing(dfq[1]))
    if fcache != ""
        dfc = CSV.read(fcache, delim = ",", header = 0)
        index = minimum(filter(k -> ismissing(dfc[k, 2]) || dfc[k, 2] == "", 1:size(df, 1)))
        if index > 1
            @assert dfc[1:(index - 1), 1] == queryset[1:(index - 1)]
            labelset = collect(skipmissing(dfc[1:(index - 1), 2]))
            return ClassifyData(queryset, labelset)
        end
    end
    return ClassifyData(queryset)
end

function dumpdata(data::ClassifyData)
    df = DataFrame(query = data.queries, label = data.labels)
    CSV.write("data/classify_out.csv", df, delim = ",", writeheader = false)
end

DataSet = loadquery("data/demo_query.csv")

end
