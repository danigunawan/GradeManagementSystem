class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :section
  
  validates_presence_of :user, :section
  validates_uniqueness_of :section, scope: [:user_id]

  def display_name
     "#{self.user.name} - #{self.section.subject.course_code} (#{self.section.name})" unless (self.user.blank? || self.section.blank?)
  end

end
