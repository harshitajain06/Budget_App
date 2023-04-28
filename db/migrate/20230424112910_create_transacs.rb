class CreateTransacs < ActiveRecord::Migration[7.0]
  def change
    create_table :transacs do |t|
      t.string :name
      t.decimal :amount
      t.text :category
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
