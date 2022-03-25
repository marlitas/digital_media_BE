class AddVideoToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :video, :string
  end
end
