# frozen_string_literal: true

class ChangeProductsIdToProductIdOnProductOption < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :product_options, column: :products_id

    rename_column :product_options, :products_id, :product_id

    add_foreign_key :product_options, :products
  end
end
