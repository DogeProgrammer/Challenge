# frozen_string_literal: true

class ProductOptionValue < ApplicationRecord
  belongs_to :product_option
  has_and_belongs_to_many :product_option_properties, join_table: 'product_option_values_product_option_properties'
end
