require 'rails_helper'

RSpec.describe Book, type: :model do
    
    it "is valid with valid attributes" do
        book = Book.new(title: "anything", author: "anything", genre: "anything", price: "anything", publishedDate: "anything")
        expect(book).to be_valid
    end

    it "is not valid without a title" do
        book = Book.new(title: nil, author: "anything", genre: "anything", price: "anything", publishedDate: "anything")
        expect(book).to_not be_valid
    end

    it "is not valid without an author" do
        book = Book.new(title: "anything", author: nil, genre: "anything", price: "anything", publishedDate: "anything")
        expect(book).to_not be_valid
    end

    it "is not valid without a genre" do
        book = Book.new(title: "anything", author: "anything", genre: nil, price: "anything", publishedDate: "anything")
        expect(book).to_not be_valid
    end

    it "is not valid without a price" do
        book = Book.new(title: "anything", author: "anything", genre: "anything", price: nil, publishedDate: "anything")
        expect(book).to_not be_valid
    end

    it "is not valid without a publishedDate" do
        book = Book.new(title: "anything", author: "anything", genre: "anything", price: "anything", publishedDate: nil)
        expect(book).to_not be_valid
    end

    
end
