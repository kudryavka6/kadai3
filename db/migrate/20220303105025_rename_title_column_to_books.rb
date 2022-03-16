class RenameTitleColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :Title, :title
    rename_column :books, :Opinion, :bo
  end
end
