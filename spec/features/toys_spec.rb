require 'rails_helper'

feature "Toys belong to cats" do

  scenario "Users can see cat that owns toy on index" do

    cat = Cat.create!(
          name: "Fritz"
    )
    toy  = Toy.create!(
          name: "Cat Missle Launcher",
          cat_id: cat.id
    )

    visit "/"
    click_on "Toys"
    expect(page).to have_content("Cat Missle Launcher")
    expect(page).to have_content("Fritz")

  end

  scenario  "Users can toys cat on show page" do

    cat = Cat.create!(
          name: "Fritz"
    )
    toy  = Toy.create!(
          name: "Cat Missle Launcher",
          cat_id: cat.id
    )

    visit toys_path
    click_on "Cat Missle Launcher"
    expect(page).to have_content("Fritz")

  end

  scenario "Users can select collection of cats when creating new toy" do

    cat = Cat.create!(
          name: "Fritz"
    )

    visit new_toy_path
    fill_in "Name", with: "Ball"
    select("Fritz", from: "toy_cat_id")
    click_on "Create Toy"
    expect(page).to have_content("Fritz")
    expect(page).to have_content("Ball")

  end

end
