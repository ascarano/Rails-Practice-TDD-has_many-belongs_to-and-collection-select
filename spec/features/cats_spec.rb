require 'rails_helper'

feature "Cats have toys" do

  scenario "User can see cat's toys" do

    cat = Cat.create!(
          name: "Fritz"
    )
    toy  = Toy.create!(
          name: "Cat Missle Launcher",
          cat_id: cat.id
    )

    visit "/"
    click_on "Cats"
    expect(page).to have_content("Fritz")
    click_on "Fritz"
    expect(page).to have_content("Cat Missle Launcher")

  end

end
