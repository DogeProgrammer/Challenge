# frozen_string_literal: true

class RemoveProductOptionValueIdFromProductOptionProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_option_properties, :product_option_values_id
  end
end
