# frozen_string_literal: true

class ChangeProductOptionPropertiesReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :product_option_properties, :product_options, foreign_key: true
    add_reference :product_option_properties, :product_option_values, foreign_key: true
  end
end
