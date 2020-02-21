require 'rails_helper'

describe 'as a user' do
    it 'can find a book and its corresponding info using the search bar' do
        visit '/'

        fill_in :title, with: 'the man who saw everything'
        click_button 'Find Book'

        expect(current_path).to be eql('/search')

        expect(page).to have_content('Title: The Man Who Saw Everything')
        expect(page).to have_content('Author: Deborah Levy')
        expect(page).to have_content('Genre: N/A')

        expect(page).to have_content('Review Count: 2')
        expect(page).to have_content("The Man Who Saw Everything,” which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at “authoritarian old men.")
        expect(page).to have_content("Deborah Levy’s latest novel, “The Man Who Saw Everything,” experiments with time travel, history and the endless complications of love.")
        expect(page).to have_content("Review Publication Date: 2019-10-09")
        expect(page).to have_content("Review Publication Date: 2019-10-15")

    end
end

