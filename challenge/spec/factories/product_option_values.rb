# frozen_string_literal: true

FactoryBot.define do
  factory :product_option_value do
    product_option
    name { Faker::Commerce.product_name }
  end
end
