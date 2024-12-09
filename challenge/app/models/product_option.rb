# frozen_string_literal: true

class ProductOption < ApplicationRecord
  belongs_to :product
  has_many :product_option_values

  enum option_type: { storage: 0, colour: 1 }
end
