import React from 'react';
import Badges from '../Badges';
import Carousel from '../Carousel';
import { ProductWithVariants, Variant } from '../shared';

const ProductInfo = ({
  product,
  color,
  storage,
  colorId,
  storageId,
  setColor,
  setColorId,
  setStorage,
  setStorageId,
}: {
  product: ProductWithVariants;
  color: string;
  storage: string;
  colorId: number;
  storageId: number;
  setColor: React.Dispatch<React.SetStateAction<string>>;
  setColorId: React.Dispatch<React.SetStateAction<number>>;
  setStorage: React.Dispatch<React.SetStateAction<string>>;
  setStorageId: React.Dispatch<React.SetStateAction<number>>;
}) => (
  <>
    <div className="col">
      <Badges
        isNew={product.is_new}
        stock={product.stock}
        discount={product.discount}
      />
      <div className="product-info">
        <p className="blue-color no-margin">{product.brand}</p>
        {product.name}
        <div className="col d-lg-none">
          <Carousel product={product} />
        </div>
        <div className="product-info-container product-info-font gray-color">
          <div className="product-info-section">
            <div>Color:&nbsp;&nbsp;&nbsp;{color}</div>
            <div className="d-flex">
              {product.colors?.map((optionValue) => {
                const isActiveColor = color === optionValue.value;

                return (
                  <div
                    key={optionValue.id}
                    className="color-option"
                    onClick={() => {
                      setColor(optionValue.value);
                      setColorId(optionValue.id);
                    }}
                  >
                    <div
                      className={`outer-circle ${isActiveColor ? 'active' : 'inactive'}`}
                    >
                      <div
                        className="inner-circle"
                        style={{
                          backgroundColor: optionValue.value,
                        }}
                      ></div>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          <hr className="my-4" />

          <div className="product-info-section">
            <div>Storage (GB)</div>
            <div className="d-flex">
              {product.storage?.map((optionValue) => {
                const isActiveStorage = storage === optionValue.value;

                return (
                  <div
                    key={optionValue.id}
                    className={`rounded-pill mb-2 storage-buttons ${
                      isActiveStorage ? 'border border-danger' : 'border'
                    }`}
                    onClick={() => {
                      setStorage(optionValue.value);
                      setStorageId(optionValue.id);
                    }}
                  >
                    {optionValue.value}
                  </div>
                );
              })}
            </div>
          </div>

          <hr className="my-4 d-none d-lg-flex" />
          <div className="product-info-section d-none d-lg-flex">
            <div>Upfront </div>
            <div className="red-color product-price d-flex">
              {
                product.variants?.find(
                  (x) =>
                    x.color_option_value_id === colorId &&
                    x.storage_option_value_id === storageId,
                )?.upfront
              }
            </div>
          </div>
        </div>
      </div>
      <div className="pb-5 pt-2 d-none d-lg-flex justify-content-end">
        <button
          type="button"
          className="btn-lg red-background-color text-white add-to-cart-button"
        >
          Add to Cart
        </button>
      </div>
    </div>
    <div className="d-lg-none mobile-product-info gx-0">
      <div className="gray-color container">
        <div className="row mt-2 mb-2 product-info-font">
          <div className="product-info-section">
            <button
              type="button"
              className="btn-lg red-background-color text-white btn mobile-continue-button"
            >
              Continue
            </button>
            <div className="mobile-price-container">
              <div>Upfront </div>
              <div className="red-color mobile-price">
                {
                  product.variants?.find(
                    (x) =>
                      x.color_option_value_id === colorId &&
                      x.storage_option_value_id === storageId,
                  )?.upfront
                }
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </>
);

export default ProductInfo;
