class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :Title
      t.text :Opinion
      t.integer :user_id
      t.timestamps
    end
  end
end
