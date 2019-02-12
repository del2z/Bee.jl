#!/usr/bin/env julia
# del2z <delta.z@aliyun.com>

module ClassifyController

using Genie.Renderer
using Genie.Router

mutable struct Book
    title::String
    author::String

    Book(title::String, author::String) = new(title, author)
    Book(; title::String = "", author::String = "") = new(title, author)
end

const BillGatesBooks = Book[
    Book("The Best We Could Do", "Thi Bui"),
    Book("Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
    Book("Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
    Book("The Sympathizer", "Viet Thanh Nguyen"),
    Book("Energy and Civilization, A History", "Vaclav Smil")
]

function billgatesbooks()
    html!(:classify, :classify, books = BillGatesBooks)
end

function new()
    html!(:classify, :anno, books = BillGatesBooks)
end

function create()
    @params(:label) |> println
    redirect_to(:get_bgbooks)
end

end
