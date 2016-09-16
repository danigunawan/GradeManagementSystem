class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :section
  
  validates_presence_of :user, :section
  validates_uniqueness_of :section
end
