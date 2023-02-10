require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  describe '#instance_method' do
    let!(:knitting) {Course.create!(name: "Knitting") }

    before do
      knitting.residents.create!(name: "Max Power", age: 50, occupation: "villain")
    end

    describe '#number_enrolled' do
      it 'should return the size of the residents that are enrolled' do
        expect(knitting.number_enrolled).to_not eq(0)
        expect(knitting.number_enrolled).to eq(1)
      end
    end
  end

end
