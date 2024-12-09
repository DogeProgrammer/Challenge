# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request, requests_api: true do
  let(:page) { 1 }
  let(:per_page) { 1 }
  let(:product) { create(:product) }
  let(:headers) { { 'ACCEPT' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:uri) { "/api/v1/products/index?page=#{page}&per_page=#{per_page}" }

  describe 'GET /api/v1/products/index' do
    before do
      product
      get uri, headers:
    end

    it 'returns 200 HTTP status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the product data' do
      json_response = JSON.parse(response.body)
      expect(json_response['products'][0]['brand']).to eq(product.brand)
      expect(json_response['products'][0]['name']).to eq(product.name)
      expect(json_response['products'][0]['price']).to eq(product.price)
      expect(json_response['products'][0]['upfront']).to eq(product.upfront)
      expect(json_response['products'][0]['image']).to eq(product.image)
      expect(json_response['products'][0]['stock']).to eq(product.stock)
      expect(json_response['products'][0]['category']).to eq(product.category)
    end

    describe 'bad GET' do
      let(:page) { 200 }

      it 'returns 200 HTTP status' do
        expect(response).to have_http_status(:success)
      end

      it 'does not return product data' do
        json_response = JSON.parse(response.body)
        expect(json_response['products']).to be_empty
      end
    end
  end

  describe 'GET /api/v1/products/count' do
    let(:uri) { '/api/v1/products/count' }

    before do
      product
      get uri, headers:
    end

    it 'returns 200 HTTP status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the product data' do
      json_response = JSON.parse(response.body)
      expect(json_response).to eq(1)
    end
  end

  describe 'GET /api/v1/products/show' do
    let(:uri) { "/api/v1/products/show/#{product.id}" }
    let(:product) { create(:product, :with_variants) }

    before do
      product
      get uri, headers:
    end

    it 'returns 200 HTTP status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the product data' do
      json_response = JSON.parse(response.body)
      expect(json_response['brand']).to eq(product.brand)
      expect(json_response['name']).to eq(product.name)
      expect(json_response['price']).to eq(product.price)
      expect(json_response['upfront']).to eq(product.upfront)
      expect(json_response['stock']).to eq(product.stock)
    end

    describe 'bad GET' do
      let(:uri) { '/api/v1/products/show/0' }
      let(:page) { 200 }

      it 'returns 404 HTTP status' do
        expect(response.status).to eq(404)
      end
    end

    describe 'product without variants' do
      let(:product) { create(:product) }
      it 'returns 200 HTTP status' do
        expect(response).to have_http_status(:success)
      end

      it 'does not return variants_data' do
        json_response = JSON.parse(response.body)
        expect(json_response).to be_empty
      end
    end
  end
end
