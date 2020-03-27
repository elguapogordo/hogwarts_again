require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "visits a professor show page and sees a list of students" do
    snape = Professor.create!(
      name: "Severus Snape",
      age: 45,
      specialty: "Potions"
    )
    harry = snape.students.create!(
      name: "Harry Potter",
      age: 11,
      house: "Gryffindor"
    )
    malfoy = snape.students.create!(
      name: "Draco Malfoy",
      age: 12,
      house: "Slytherin"
    )
    longbottom = snape.students.create!(
      name: "Neville Longbottom",
      age: 11,
      house: "Gryffindor"
    )

    visit '/professors'

    click_link "Severus Snape"

     expect(current_path).to eq("/professors/#{snape.id}")

    expect(page).to have_content("Name: #{harry.name}")
    expect(page).to have_content("Age: #{harry.age}")
    expect(page).to have_content("House: #{harry.house}")
    expect(page).to have_content("Name: #{longbottom.name}")
    expect(page).to have_content("Age: #{longbottom.age}")
    expect(page).to have_content("House: #{longbottom.house}")

  end
end

# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#       "Hermione Granger"
#       "Luna Lovegood")
