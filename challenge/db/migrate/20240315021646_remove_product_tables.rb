class RemoveProductTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_options_products
    drop_table :product_option_product_option_values
  end
end
