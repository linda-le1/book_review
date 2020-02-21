class SearchController < ApplicationController
    def index
        title = params["title"].gsub(" ", "+")
        response = Faraday.get("http://openlibrary.org/search.json?title=#{title}")
        book_info = JSON.parse(response.body)

        @book = Book.new(book_info)

        response_2 = Faraday.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{title}&api-key=#{ENV['NYT_API_KEY']}")

        reviews = JSON.parse(response_2.body)["results"]

        @reviews = reviews.map do |review_info|
            Review.new(review_info)
        end
    end
end