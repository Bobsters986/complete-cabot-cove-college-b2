require 'rails_helper'

RSpec.describe '/courses/index', type: :feature do
  let!(:knitting) { Course.create!(name: "Knitting") }
  let!(:skydiving) { Course.create!(name: "Skydiving") }

  before do
    knitting.residents.create!(name: "Max Power", age: 50, occupation: "villain")
    knitting.residents.create!(name: "Low Power", age: 10, occupation: "startup villain")
    knitting.residents.create!(name: "Mid Power", age: 38, occupation: "dad-bod-villain")
    skydiving.residents.create!(name: "Joe Mama", age: 45, occupation: "sidekiq")
  end

  it 'shows all the attributes of all residents' do
    visit '/courses'
    
    expect(page).to have_content("#{knitting.name}: #{knitting.residents.size}")
  end
end