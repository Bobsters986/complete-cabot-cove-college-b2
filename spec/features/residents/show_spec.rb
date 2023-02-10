require 'rails_helper'

RSpec.describe Resident, type: :feature do
  let!(:max) { Resident.create!(name: "Max Power", age: 50, occupation: "villain") }
  let!(:skydiving) { Course.create!(name: "Skydiving") }
  let!(:scubadiving) { Course.create!(name: "Scubadiving") }

  before do
    ResidentCourse.create!(resident: max, course: scubadiving)
    ResidentCourse.create!(resident: max, course: skydiving)
  end

  it 'shows all the attributes of all residents' do
    visit "/residents/#{max.id}"

    expect(page).to have_content("#{max.name}")
    expect(page).to have_content("Courses:")
    expect(page).to have_content("- #{skydiving.name}")
    expect(page).to have_content("- #{scubadiving.name}")
  end
end