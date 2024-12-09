# frozen_string_literal: true

10.times do
  random_number = rand(1..100)
  iphone = Product.create(
    brand: 'iPhone',
    name: "Model-#{random_number}",
    price: 999.99,
    upfront: 199.99,
    image: 'https://assets.swappie.com/cdn-cgi/image/width=600,height=600,fit=contain,format=auto/swappie-iphone-15-pro-max-natural-titanium-back.png?v=9166c13e',
    category: :devices,
    stock: 100
  )

  samsung = Product.create(
    brand: 'Samsung',
    name: "Model-#{random_number}",
    price: 899.99,
    upfront: 149.99,
    image: 'https://purepng.com/public/uploads/large/purepng.com-samsung-phonesmartphoneandroidgooglephoneapplication-211519339028ghq1u.png',
    category: :devices,
    stock: 0,
    created_at: 28.days.ago
  )

  google = Product.create(
    brand: 'Google',
    name: "Model-#{random_number}",
    price: 899.99,
    upfront: 149.99,
    image: 'https://t-mobile.scene7.com/is/image/Tmusprod/Google-Pixel-6-6-Pro-hero-no-logo-1889982-2%3A1-to-1-ratio?ts=1678462857503&fmt=png-alpha&dpr=off',
    category: :devices,
    stock: 100,
    created_at: 28.days.ago,
    discount: random_number
  )

  huawei = Product.create(
    brand: 'Huawei',
    name: "Model-#{random_number}",
    price: 899.99,
    upfront: 99.99,
    image: 'https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/pdp/admin-image/phones/nova-y70/list/list-blue.png',
    category: :devices,
    stock: 100,
    created_at: 28.days.ago
  )

  image_urls = [
    'https://assets.swappie.com/cdn-cgi/image/width=600,height=600,fit=contain,format=auto/swappie-iphone-15-pro-max-natural-titanium-back.png?v=9166c13e',
    'https://purepng.com/public/uploads/large/purepng.com-samsung-phonesmartphoneandroidgooglephoneapplication-211519339028ghq1u.png',
    'https://t-mobile.scene7.com/is/image/Tmusprod/Google-Pixel-6-6-Pro-hero-no-logo-1889982-2%3A1-to-1-ratio?ts=1678462857503&fmt=png-alpha&dpr=off',
    'https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/pdp/admin-image/phones/nova-y70/list/list-blue.png'
  ]

  # Create product options for iPhone
  iphone_color_option = iphone.product_options.create(option_type: :colour)
  iphone_storage_option = iphone.product_options.create(option_type: :storage)

  # Create product option values for iPhone color option
  iphone_color_option.product_option_values.create(value: 'red')
  iphone_color_option.product_option_values.create(value: 'blue')
  iphone_color_option.product_option_values.create(value: 'black')

  # Create product option values for iPhone storage option
  iphone_storage_option.product_option_values.create(value: '64GB')
  iphone_storage_option.product_option_values.create(value: '128GB')
  iphone_storage_option.product_option_values.create(value: '256GB')

  # Create product option properties for iPhone
  iphone_color_option.product_option_values.each do |color_value|
    iphone_storage_option.product_option_values.each do |storage_value|
      iphone_option_property = color_value.product_option_properties.create(
        stock: rand(10..50),
        price: rand(500..1000),
        upfront: rand(50..200)
      )
      iphone_option_property.update(image: image_urls.sample)

      storage_value.product_option_properties << iphone_option_property
    end
  end

  # Samsung
  samsung_color_option = samsung.product_options.create(option_type: :colour)
  samsung_storage_option = samsung.product_options.create(option_type: :storage)

  # Create product option values for samsung color option
  samsung_color_option.product_option_values.create(value: 'red')
  samsung_color_option.product_option_values.create(value: 'blue')
  samsung_color_option.product_option_values.create(value: 'black')
  samsung_color_option.product_option_values.create(value: 'gray')

  # Create product option values for samsung storage option
  samsung_storage_option.product_option_values.create(value: '64GB')
  samsung_storage_option.product_option_values.create(value: '128GB')
  samsung_storage_option.product_option_values.create(value: '256GB')

  # Create product option properties for samsung
  samsung_color_option.product_option_values.each do |color_value|
    samsung_storage_option.product_option_values.each do |storage_value|
      samsung_option_property = color_value.product_option_properties.create(
        stock: 0,
        price: rand(500..1000),
        upfront: rand(50..200)
      )
      samsung_option_property.update(image: image_urls.sample)
      storage_value.product_option_properties << samsung_option_property
    end
  end

  # Google
  google_color_option = google.product_options.create(option_type: :colour)
  google_storage_option = google.product_options.create(option_type: :storage)

  # Create product option values for google color option
  google_color_option.product_option_values.create(value: 'red')
  google_color_option.product_option_values.create(value: 'black')

  # Create product option values for google storage option
  google_storage_option.product_option_values.create(value: '64GB')
  google_storage_option.product_option_values.create(value: '128GB')
  google_storage_option.product_option_values.create(value: '256GB')

  # Create product option properties for google
  google_color_option.product_option_values.each do |color_value|
    google_storage_option.product_option_values.each do |storage_value|
      google_option_property = color_value.product_option_properties.create(
        stock: 100,
        price: rand(500..1000),
        upfront: rand(50..200)
      )
      google_option_property.update(image: image_urls.sample)
      storage_value.product_option_properties << google_option_property
    end
  end

  # Huawei
  huawei_color_option = huawei.product_options.create(option_type: :colour)
  huawei_storage_option = huawei.product_options.create(option_type: :storage)

  # Create product option values for huawei color option
  huawei_color_option.product_option_values.create(value: 'red')
  huawei_color_option.product_option_values.create(value: 'blue')
  huawei_color_option.product_option_values.create(value: 'brown')

  # Create product option values for huawei storage option
  huawei_storage_option.product_option_values.create(value: '64GB')
  huawei_storage_option.product_option_values.create(value: '128GB')
  huawei_storage_option.product_option_values.create(value: '256GB')

  # Create product option properties for huawei
  huawei_color_option.product_option_values.each do |color_value|
    huawei_storage_option.product_option_values.each do |storage_value|
      huawei_option_property = color_value.product_option_properties.create(
        stock: 100,
        price: rand(500..1000),
        upfront: rand(50..200)
      )
      huawei_option_property.update(image: image_urls.sample)
      storage_value.product_option_properties << huawei_option_property
    end
  end
end
