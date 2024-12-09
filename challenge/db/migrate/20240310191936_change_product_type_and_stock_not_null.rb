# frozen_string_literal: true

class ChangeProductTypeAndStockNotNull < ActiveRecord::Migration[7.0]
  def change
    # Change the type column to NOT NULL
    change_column :products, :type, :integer, null: false

    # Change the stock column to NOT NULL
    change_column :products, :stock, :integer, null: false
  end
end
