require 'rails_helper'

RSpec.describe 'Book Controller', type: :feature do
  describe 'index page' do
    it 'creates a new book' do
      visit 'books#index'
      expect(page).to have_text('Book Collection')
      click_on 'New Book'

      fill_in "Title", with: "The Handmaid's Tale"
      fill_in "Author", with: "Margaret Atwood"
      select "Fantasy", from: "Genre"
      fill_in "Price", with: "30"
      fill_in "book_publishedDate", with: "08/12/2020"

      click_on 'Create Book'

      expect(page).to have_text("The Handmaid's Tale was added.")
      expect(Book.where(title: "The Handmaid's Tale", author: "Margaret Atwood", genre: "Fantasy", price: "30", publishedDate: "08/12/2020")).to exist
    end
  end

  describe 'index page' do
    it 'shows a book' do
      Book.create(title: "The Handmaid's Tale", author: "Margaret Atwood", genre: "Fantasy", price: "25", publishedDate: "08/12/2020")
      visit 'books#index'
      expect(page).to have_text('Book Collection')
      click_on 'Show'
      expect(page).to have_text("Show Book")
      expect(page).to have_text("The Handmaid's Tale")
      expect(page).to have_text("Margaret Atwood")
      expect(page).to have_text("Fantasy")
      expect(page).to have_text("25")
      expect(page).to have_text("08/12/2020")
    end
  end


  describe 'index page' do
    it 'edits a book' do
      Book.create(title: "The Handmaid's Tale", author: "Margaret Atwood", genre: "Fantasy", price: "25", publishedDate: "08/12/2020")
      visit 'books#index'
      expect(page).to have_text('Book Collection')

      click_on "Edit" 
      fill_in "Title", with: "The Count of Monte Cristo"
      fill_in "Author", with: "Alexandre Dumas"
      select "Mystery", from: "Genre"
      fill_in "Price", with: "25"
      fill_in "book_publishedDate", with: "03/15/1985"     
      click_on "Update Book"

      expect(page).to have_text("The Count of Monte Cristo was updated.")
      expect(Book.where(title: "The Count of Monte Cristo", author: "Alexandre Dumas", genre: "Mystery", price: "25", publishedDate: "03/15/1985")).to exist
    end
  end

  describe 'index page' do
    it 'deletes a book' do
      Book.create(title: "The Handmaid's Tale", author: "Margaret Atwood", genre: "Fantasy", price: "25", publishedDate: "08/12/2020")
      visit 'books#index'
      expect(page).to have_text('Book Collection')

      click_on "Delete" 

      expect(page).to have_text("Are you sure?")
      click_on "Yes"
      expect(page).to have_text("The Handmaid's Tale was deleted.")
      expect(Book.where(title: "The Count of Monte Cristo", author: "Alexandre Dumas", genre: "Mystery", price: "25", publishedDate: "03/15/1985")).to_not exist
    end
  end
end