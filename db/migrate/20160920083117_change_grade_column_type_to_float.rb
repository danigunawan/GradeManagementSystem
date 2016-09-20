class ChangeGradeColumnTypeToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :registrations, :grade, :float, precision: 1, scale: 2
  end
end
