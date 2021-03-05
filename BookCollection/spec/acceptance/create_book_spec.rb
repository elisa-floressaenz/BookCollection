require 'rails_helper'

feature "User creates book" do
    scenario "successfully" do
        visit root_path
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Fantasy", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "08/12/2020"

        click_on "Create Book"

        expect(page).to have_text("The Handmaid's Tale was added.")
    end

    scenario "unsuccessfully" do
        visit root_path
        click_on "New Book"
        fill_in "Title", with: "The Handmaid's Tale"
        fill_in "Author", with: "Margaret Atwood"
        select "Mystery", from: "Genre"
        fill_in "Price", with: "30"
        fill_in "book_publishedDate", with: "2020/08/12"

        click_on "Create Book"

    end
end