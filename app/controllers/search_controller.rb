class SearchController < ApplicationController
    def index
        render locals: {
            search_results: SearchResultsFacade.new(params["title"])
        }
    end
end