# frozen_string_literal: true

class CreateProductOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_options do |t|
      t.integer :option_type
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
