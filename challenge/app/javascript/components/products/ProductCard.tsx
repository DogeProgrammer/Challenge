// ProductCard.tsx
import React from 'react';
import { Link } from 'react-router-dom';
import Badges from '../Badges';
import { Product } from '../shared';

const ProductCard = ({ product }: { product: Product }) => {
  const renderPrice = (price: number) => {
    const numberString = price.toFixed(2).toString().split('.');
    const number = numberString[0];
    const decimals = numberString[1];
    return (
      <>
        {number}
        <sup>{decimals}</sup>
      </>
    );
  };

  return (
    <div className="col-lg-3 col-6 product-card">
      <Link className="link" to={`/products/${product.id}`}>
        <div className="card d-flex flex-column">
          <div className="product-badges">
            <Badges
              isNew={product.is_new}
              stock={product.stock}
              discount={product.discount}
            />
          </div>
          <div
            className={`product-image-container ${product.is_new ? 'new' : ''} ${product.discount ? 'discount' : ''} ${
              product.stock === 0 ? 'out-of-stock' : ''
            }`}
          >
            <img
              src={product.image}
              className={`card-img-top ${product.stock === 0 ? 'out-of-stock' : ''}`}
              alt={`${product.name}`}
            />
          </div>
          <div className="card-body pb-0">
            <div className="d-none d-lg-flex pb-4 product-info-header">
              <div>
                <div className="product-brand">{product.brand}</div>
                <div className="product-name">{product.name}</div>
              </div>
              <div className="color-palette">
                {product.colors.map((optionValue) => (
                  <div
                    key={optionValue.id}
                    className="color-circle"
                    style={{ backgroundColor: optionValue.value }}
                  ></div>
                ))}
              </div>
            </div>
            {/* mobile*/}
            <div className="d-lg-none">
              <div className="mobile-color-palette">
                {product.colors.map((optionValue) => (
                  <div
                    key={optionValue.id}
                    className="mobile-color-circle"
                    style={{ backgroundColor: optionValue.value }}
                  ></div>
                ))}
              </div>
              <div>
                <div className="card-title product-brand">
                  <p className="no-margin">{product.brand}</p>
                  {product.name}
                </div>
              </div>
            </div>
            {/* mobile*/}
            <div>
              <div className="product-price-info">Upfront</div>
              <div className="product-price">
                {product.discount ? (
                  <div>
                    <div className="lead text">
                      {renderPrice(
                        (product.upfront * (100 - product.discount)) / 100,
                      )}
                    </div>
                    <div className="product-original-price">
                      {product.upfront}
                    </div>
                  </div>
                ) : (
                  <div className="lead text">
                    {renderPrice(product.upfront)}
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      </Link>
    </div>
  );
};

export default ProductCard;
