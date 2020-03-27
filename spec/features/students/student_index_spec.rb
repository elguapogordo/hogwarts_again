require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "visits students index and sees a list of students" do
    snape = Professor.create(
      name: "Severus Snape",
      age: 45,
      specialty: "Potions"
    )

    visit "/students"

    expect(page).to have_content("Name: #{snape.name}")
    expect(page).to have_content("Age: #{snape.age}")
    expect(page).to have_content("Specialty: #{snape.specialty}")
    expect(page).to have_content("Name: #{hagarid.name}")
    expect(page).to have_content("Age: #{hagarid.age}")
    expect(page).to have_content("Specialty: #{hagarid.specialty}")
    expect(page).to have_content("Name: #{lupin.name}")
    expect(page).to have_content("Age: #{lupin.age}")
    expect(page).to have_content("Specialty: #{lupin.specialty}")

  end
end
# When I visit '/students'
# I see a list of students and the number of professors each student has.
# (e.g. "Draco Malfoy: 5"
