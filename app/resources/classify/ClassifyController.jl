#!/usr/bin/env julia
# del2z <delta.z@aliyun.com>

module ClassifyController

using Genie.Renderer

struct Book
    title::String
    author::String
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

end
