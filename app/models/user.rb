class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :registrations, dependent: :destroy
  has_many :subjects, through: :registrations      
  has_many :sections
  belongs_to :role
  
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= Role.find_by(name: 'student')
  end
  
  def has_role?(role_name)
    self.role.name == role_name
  end
         
  def email_changed?
    false
  end
         
  def email_required?
    false
  end
         
end
