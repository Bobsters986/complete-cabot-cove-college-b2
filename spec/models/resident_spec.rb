require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  describe '#class_methods' do
    before do
      Resident.create!(name: "Max Power", age: 5, occupation: "villain")
      Resident.create!(name: "Joe", age: 5, occupation: "villain")
    end

    describe '.average_age' do
      it 'should return the average age' do
        expect(Resident.average_age).to eq(5)
      end
    end
  end

end
