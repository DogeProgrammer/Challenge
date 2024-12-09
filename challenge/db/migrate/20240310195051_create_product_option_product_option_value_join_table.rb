# frozen_string_literal: true

class CreateProductOptionProductOptionValueJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :product_option_product_option_values, id: false do |t|
      t.references :product_option, null: false, foreign_key: true, index: { name: 'index_pp_pv_on_option_id' }
      t.references :product_option_value, null: false, foreign_key: true, index: { name: 'index_pp_pv_on_value_id' }
    end

    add_index :product_option_product_option_values, %i[product_option_id product_option_value_id], unique: true,
                                                                                                    name: 'index_pp_pv_on_option_and_value'
  end
end
