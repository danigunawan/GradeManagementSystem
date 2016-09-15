class Subject < ApplicationRecord
  has_many :registrations, through: :sections, dependent: :destroy
  has_many :users, through: :registrations
  has_many :sections, dependent: :destroy

end
