class Section < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations
  
  validates_presence_of :name, :user, :subject
  
end
