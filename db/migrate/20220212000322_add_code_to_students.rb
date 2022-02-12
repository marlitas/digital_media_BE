class AddCodeToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :code, :string
  end
end
