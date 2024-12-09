# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show]
      def index
        page = params[:page].to_i
        per_page = params[:per_page].to_i
        offset = (page - 1) * per_page
        products = Product.includes(product_options: :product_option_values).limit(per_page).offset(offset)
        has_more = Product.offset(offset + per_page).exists?

        products_with_new_flag = products.map do |product|
          colors = product.colors
          product_json = product.as_json(except: :product_options, methods: :colors)
          product_json.merge(is_new: product.new?, colors:)
        end

        render json: { products: products_with_new_flag, has_more: }
      end

      def show
        render json: @product.variants
      end

      def count
        render json: Product.count
      end

      private

      def set_product
        @product = Product.includes(product_options: { product_option_values: :product_option_properties }).find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found 
      end
    end
  end
end
