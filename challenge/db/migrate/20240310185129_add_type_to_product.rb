# frozen_string_literal: true

class AddTypeToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :type, :integer
  end
end
