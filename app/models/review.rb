class Review
    attr_reader :summary, :publication_date

    def initialize(info)
        @summary = info['summary']
        @publication_date = info['publication_dt']
    end

end