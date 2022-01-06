class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :about
      t.string :major
      t.boolean :enrolled

      t.timestamps
    end
  end
end
