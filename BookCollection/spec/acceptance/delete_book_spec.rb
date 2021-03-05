require 'rails_helper'

feature "User deletes book" do
    scenario "successfully" do
        visit root_path ##Create Book (to delete it)
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        click_on "Delete" ##Delete Book
        expect(page).to have_text("Are you sure?")

        click_on "Yes"
        expect(page).to have_text("The Handmaid's Tale was deleted.")
    end
end

feature "User attempts to delete book" do
    scenario "successfully" do
        visit root_path ##Create Book
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        click_on "Delete" ##Delete Book
        expect(page).to have_text("Are you sure?")

        click_on "No" ##Back To Show Book
        expect(page).to have_text("Show Book")
    end
end
