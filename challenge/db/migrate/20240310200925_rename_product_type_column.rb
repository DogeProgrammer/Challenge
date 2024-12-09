# frozen_string_literal: true

# db/migrate/[timestamp]_rename_product_type_column.rb

class RenameProductTypeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :type, :category
  end
end
