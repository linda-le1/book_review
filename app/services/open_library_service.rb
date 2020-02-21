class OpenLibraryService
    def initialize(title)
        @title = title
    end

    def get_book
        response = Faraday.get("http://openlibrary.org/search.json?title=#{@title}")
        book_info = JSON.parse(response.body)
    end

end