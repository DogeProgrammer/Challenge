# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.float :upfront, null: false
      t.string :image, default: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-15-pro-max-family-select?wid=4000&hei=3794&fmt=jpeg&qlt=90&.v=1692893974945'

      t.timestamps
    end
  end
end
