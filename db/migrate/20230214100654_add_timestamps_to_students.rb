class AddTimestampsToStudents < ActiveRecord::Migration[5.2]
  def change
		add_column :students, :created_at, :datetime
		add_column :students, :updated_at, :datetime
		# t.timestamps
  end
end
