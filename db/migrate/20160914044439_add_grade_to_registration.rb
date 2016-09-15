class AddGradeToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :grade, :decimal, precision: 1, scale: 2
  end
end
