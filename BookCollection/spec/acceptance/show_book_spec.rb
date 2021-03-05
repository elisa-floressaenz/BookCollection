require 'rails_helper'

feature "User shows book information" do
    scenario "successfully" do
        visit root_path ##Create Book
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        click_on "Show" ##Show Book
        expect(page).to have_text("Show Book")

    end

end

feature "User shows book information and edits" do
    scenario "successfully" do
        visit root_path ##Create Book
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        click_on "Show" ##Show Book
        expect(page).to have_text("Show Book")

        click_on "Edit" ##Edit Book
        expect(page).to have_text("Update Book")
    end

end

feature "User shows book information and deletes" do
    scenario "successfully" do
        visit root_path ##Create Book
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        click_on "Show" ##Show Book
        expect(page).to have_text("Show Book")

        click_on "Delete" ##Delete Book
        expect(page).to have_text("Are you sure?")
    end

end

feature "User shows book information and redirects to root" do
    scenario "successfully" do
        visit root_path ##Create Book
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        click_on "Show" ##Show Book
        expect(page).to have_text("Show Book")

        click_on "Back To List" ##Back to List
        expect(page).to have_text("Book Collection")
    end

end
