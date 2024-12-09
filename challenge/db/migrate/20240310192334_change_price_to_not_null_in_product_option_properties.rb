# frozen_string_literal: true

class ChangePriceToNotNullInProductOptionProperties < ActiveRecord::Migration[7.0]
  def change
    change_column :product_option_properties, :price, :float, null: false
  end
end
