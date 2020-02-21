class SearchResultsFacade
    attr_reader :title

    def initialize(title)
        @title = title.gsub(" ", "+")
    end

    def reviews
        service = NewYorkTimesService.new(@title)
        @reviews = service.get_reviews.map do |info|
            Review.new(info)
        end
    end

    def book
        service = OpenLibraryService.new(@title)
        @book = Book.new(service.get_book)
    end

    def count_reviews
        reviews.count
    end
end