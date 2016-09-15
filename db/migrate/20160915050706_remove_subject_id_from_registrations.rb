class RemoveSubjectIdFromRegistrations < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :registrations, name: "subject_id"
  end
end
