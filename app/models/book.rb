class Book
    attr_reader :title, :author, :genre

    def initialize(info)
        @title = info['docs'][0]['title']
        @author = info['docs'][0]['author_name']
        if info['docs'][0].keys.include?("subjects")
            @info = info['docs'][0]['subjects']
        else
            @genre = "N/A"
        end
    end

end