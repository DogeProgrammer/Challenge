# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :upfront, presence: true
  validates :image, presence: true
  validates :stock, presence: true

  enum category: { plans: 0, devices: 1, mobile: 2 }

  has_many :product_options
  has_many :product_option_values, through: :product_options

  def new?
    created_at >= 1.week.ago
  end

  def colors
    product_option = product_options.find_by(option_type: :colour)
    return [] unless product_option

    product_option.product_option_values.pluck(:id, :value).map do |id, value|
      { id:, value: }
    end
  end

  def storage
    product_option = product_options.find_by(option_type: :storage)
    return [] unless product_option

    product_option.product_option_values.pluck(:id, :value).map do |id, value|
      { id:, value: }
    end
  end

  def variants
    color_option = product_options.find_by(option_type: :colour)
    storage_option = product_options.find_by(option_type: :storage)

    return {} unless color_option && storage_option

    product_variants = []

    color_option.product_option_values.each do |color_value|
      storage_option.product_option_values.each do |storage_value|
        property = ProductOptionProperty.joins(product_option_values: :product_option)
                                        .where(product_option_values: { id: [color_value.id, storage_value.id] })
                                        .where(product_option_properties: { id: color_value.product_option_properties.ids & storage_value.product_option_properties.ids })
                                        .first
        next unless property

        product_variants << {
          color_option_id: color_option.id,
          color_option_value_id: color_value.id,
          color_option_value: color_value.value,
          storage_option_id: storage_option.id,
          storage_option_value_id: storage_value.id,
          storage_option_value: storage_value.value,
          property_id: property.id,
          stock: property.stock,
          price: property.price,
          upfront: property.upfront,
          image: property.image
        }
      end
    end
    product = self

    {
      name:,
      brand:,
      stock:,
      price: product.price,
      upfront: product.upfront,
      is_new: product.new?,
      discount:,
      colors: product.colors,
      storage: product.storage,
      variants: product_variants
    }
  end
end
