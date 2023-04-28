class CreateCategoriesTransacsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :transacs do |t|
      t.index [:category_id, :transac_id]
    end
  end
end
