class Subject < ApplicationRecord
  has_many :registrations, through: :sections, dependent: :destroy
  has_many :sections, dependent: :destroy

  validates_presence_of :course_code, :course_name
  validates_uniqueness_of :course_code

  def naming
    "#{self.course_code} - #{self.course_name}"
  end
  
  def display_name
    "#{self.course_name}"
  end

end
