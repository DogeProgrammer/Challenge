# frozen_string_literal: true

class CreateProductOptionProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :product_option_properties do |t|
      t.integer :stock
      t.float :price
      t.string :image, default: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-max-family-select?wid=4000&hei=3794&fmt=jpeg&qlt=90&.v=1692893974945'
      t.float :upfront, null: false
      t.references :product_options, foreign_key: true

      t.timestamps
    end
  end
end
