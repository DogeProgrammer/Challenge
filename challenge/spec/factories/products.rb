# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    brand { Faker::Commerce.brand }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price.to_f }
    upfront { Faker::Commerce.price.to_f }
    image { 'https://lh3.googleusercontent.com/KaLIFYVg9298b8jv33H3pagRaAz4lCQxrQz-goMEsiTuCmUf2Ood9ktkzgjpotkMuRcAMimOV2RfN7vBZVmnInf5wcwUNsRZpw' }
    stock { 10 }
    category { 1 }
  end

  trait :with_discounts do
    after :create do |product|
      product.update(discount: 25)
    end
  end

  trait :without_stock do
    after :create do |product|
      product.stock(stock: 0)
    end
  end

  trait :with_variants do
    transient do
      variant_count { 2 }
    end

    after :create do |product, evaluator|
      option_type = create(:product_option, product:, option_type: :colour)
      option_type2 = create(:product_option, product:, option_type: :storage)

      evaluator.variant_count.times do
        value = option_type.product_option_values.create(value: 'red')
        value2 = option_type2.product_option_values.create(value: '128')

        iphone_option_property = value.product_option_properties.create(
          stock: rand(10..50),
          price: rand(500..1000),
          upfront: rand(50..200),
          image: 'https://lh3.googleusercontent.com/KaLIFYVg9298b8jv33H3pagRaAz4lCQxrQz-goMEsiTuCmUf2Ood9ktkzgjpotkMuRcAMimOV2RfN7vBZVmnInf5wcwUNsRZp'
        )
        value2.product_option_properties << iphone_option_property
      end
    end
  end
end
