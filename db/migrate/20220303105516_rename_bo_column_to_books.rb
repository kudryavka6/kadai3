class RenameBoColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :bo, :body
  end
end
