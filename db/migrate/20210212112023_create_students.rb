class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :sem
      t.string :gender
      t.string :address

      t.timestamps
    end
  end
end
