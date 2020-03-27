require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "visits a professor show page and sees a list of students" do
    snape = Professor.create(
      name: "Severus Snape",
      age: 45,
      specialty: "Potions"
    )
    hagarid = Professor.create(
      name: "Rubus Hagarid",
      age: 38 ,
      specialty: "Care of Magical Creatures"
    )
    lupin = Professor.create(
      name: "Remus Lupin",
      age: 49 ,
      specialty: "Defense Against The Dark Arts"
    )
    harry = snape.students.create!(
      name: "Harry Potter",
      age: 11,
      house: "Gryffindor"
    )
    malfoy = hagarid.students.create!(
      name: "Draco Malfoy",
      age: 12,
      house: "Slytherin"
    )
    longbottom = snape.students.create!(
      name: "Neville Longbottom",
      age: 11,
      house: "Gryffindor"
    )
    hagarid.students << harry
    lupin.students << harry
    lupin.students << malfoy

    visit '/professors'

    click_link "Severus Snape"

     expect(current_path).to eq("/professors/#{snape.id}")

    expect(page).to have_content("Name: #{harry.name}")
    expect(page).to have_content("Age: #{harry.age}")
    expect(page).to have_content("House: #{harry.house}")
    expect(page).to have_content("Name: #{longbottom.name}")
    expect(page).to have_content("Age: #{longbottom.age}")
    expect(page).to have_no_content("House: #{malfoy.house}")
    expect(page).to have_no_content("Name: #{malfoy.name}")
    expect(page).to have_no_content("Age: #{malfoy.age}")
  end
end
