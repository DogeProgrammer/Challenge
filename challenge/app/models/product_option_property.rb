# frozen_string_literal: true

class ProductOptionProperty < ApplicationRecord
  has_and_belongs_to_many :product_option_values, join_table: 'product_option_values_product_option_properties'
end
