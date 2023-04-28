class ChangeForeignKeyForTransacs < ActiveRecord::Migration[7.0]
  def change
    rename_column :transacs, :user_id, :author_id
  end
end
