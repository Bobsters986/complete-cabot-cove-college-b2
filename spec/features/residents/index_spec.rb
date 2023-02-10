require 'rails_helper'

RSpec.describe Resident, type: :feature do

  let!(:max) { Resident.create!(name: "Max Power", age: 50, occupation: "villain") }
  let!(:joe) { Resident.create!(name: "Joe Mama", age: 45, occupation: "sidekick") }

  it 'shows all the attributes of all residents' do
    visit '/residents'
    save_and_open_page

    expect(page).to have_content("Name: #{max.name}")
    expect(page).to have_content("Age: #{max.age}")
    expect(page).to have_content("Occupation: #{max.occupation}")
    expect(page).to have_content("Average Age: #{Resident.average_age}")
  end
end