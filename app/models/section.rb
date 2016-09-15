class Section < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations
end
