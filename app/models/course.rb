class Course < ApplicationRecord
  has_many :resident_courses
  has_many :residents, through: :resident_courses
  
  validates :name, presence: :true

  scope :sort_alphabetical, -> { order(:name) }

  def number_enrolled
    residents.size
  end
end
