class SearchController < ApplicationController
    def index
        title = params["title"].gsub(" ", "+")
        response = Faraday.get("http://openlibrary.org/search.json?title=#{title}")
        book = JSON.parse(response.body)

        book_object = Book.new(book)
    end
end