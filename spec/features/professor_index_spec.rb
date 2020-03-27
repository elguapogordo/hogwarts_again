require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "visits professors index and sees a list of professors" do
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

    visit "/professors"

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
