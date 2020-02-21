class NewYorkTimesService
    def initialize(title)
        @title = title
    end

    def get_reviews
        response = Faraday.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{@title}&api-key=#{ENV['NYT_API_KEY']}")
        JSON.parse(response.body)["results"]
    end
end

