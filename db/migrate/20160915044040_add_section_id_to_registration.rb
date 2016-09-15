class AddSectionIdToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_reference :registrations, :section, foreign_key: true
  end
end
