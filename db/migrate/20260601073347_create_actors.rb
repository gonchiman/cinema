class CreateActors < ActiveRecord::Migration[8.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.date :birth_date
      t.integer :height
      t.decimal :weight
      t.string :gender
      t.string :blood_type

      t.timestamps
    end
  end
end
