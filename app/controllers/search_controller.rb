class SearchController < ApplicationController
    def index
        title = params["title"].gsub(" ", "+")
        response = Faraday.get("http://openlibrary.org/search.json?title=#{title}")
        book_info = JSON.parse(response.body)

        @book = Book.new(book_info)
    end
end