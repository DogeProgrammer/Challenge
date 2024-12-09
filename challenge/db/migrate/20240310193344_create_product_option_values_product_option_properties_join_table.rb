# frozen_string_literal: true

class CreateProductOptionValuesProductOptionPropertiesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :product_option_values_product_option_properties, id: false do |t|
      t.references :product_option_value, null: false, foreign_key: true, index: { name: 'index_pv_pp_on_pv_id' }
      t.references :product_option_property, null: false, foreign_key: true, index: { name: 'index_pv_pp_on_pp_id' }
    end

    add_index :product_option_values_product_option_properties,
              %i[product_option_value_id product_option_property_id], unique: true, name: 'index_pv_pp_on_pv_id_and_pp_id'
  end
end
