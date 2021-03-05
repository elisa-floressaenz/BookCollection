require 'rails_helper'

feature "User edits book information" do
    scenario "successfully" do
        visit root_path ##Create Book
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"


        click_on "Edit" ##Edit Book
        fill_in "Title", with: "The Count of Monte Cristo"
        fill_in "Author", with: "Alexandre Dumas"
        select "Mystery", from: "Genre"
        fill_in "Price", with: "25"
        fill_in "book_publishedDate", with: "03/15/1985"

        click_on "Update Book"

        expect(page).to have_text("The Count of Monte Cristo was updated.")
    end

    scenario "unsuccessfully" do
        visit root_path
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Mystery", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        click_on "Edit" ##Edit Book
        fill_in "Title", with: "The Count of Monte Cristo"
        fill_in "Author", with: "Alexandre Dumas"
        select "Mystery", from: "Genre"
        fill_in "Price", with: "25"
        fill_in "book_publishedDate", with: "2020/08/12"

        click_on "Update Book"

    end

end