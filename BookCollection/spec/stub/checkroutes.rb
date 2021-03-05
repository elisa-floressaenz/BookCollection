require 'rails_helper'

RSpec.describe Book, :type => :request do 

    describe "request list of all books" do

        it 'can be routed' do
            book = Book.create(title: nil, author: nil, genre: nil, price: nil, publishedDate: nil)
            get books_path
            expect(response).to be_successful
        end
    end
end
