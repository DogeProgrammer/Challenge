# frozen_string_literal: true

class CreateProductProductOptionsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :products, :product_options do |t|
      t.references :products, foreign_key: true, index: true
      t.references :product_options, foreign_key: true, index: true
    end
  end
end
