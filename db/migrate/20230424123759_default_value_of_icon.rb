class DefaultValueOfIcon < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :icon, :string, :default => 'https://img.freepik.com/free-vector/shopping-supermarket-cart-with-grocery-pictogram_1284-11697.jpg'
  end
end
