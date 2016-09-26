class Section < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :users, through: :registrations
  has_many :registrations, dependent: :destroy
  
  validates_presence_of :name, :subject
  validates_uniqueness_of :name, scope: [:subject_id]
  
  def subject_name
    self.subject.course_name
  end
end
