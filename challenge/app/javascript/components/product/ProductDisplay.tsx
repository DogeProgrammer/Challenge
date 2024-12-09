import React from 'react';
import ProductInfo from './ProductInfo';
import { ProductWithVariants, Variant } from '../shared';

const ProductDisplay = ({
  variants,
  selectedPropertyId,
  setSelectedPropertyId,
  color,
  colorId,
  storage,
  storageId,
  product,
  setColor,
  setColorId,
  setStorage,
  setStorageId,
}: {
  variants: Variant[];
  selectedPropertyId: number;
  setSelectedPropertyId: React.Dispatch<React.SetStateAction<number>>;
  color: string;
  colorId: number;
  storage: string;
  storageId: number;
  product: ProductWithVariants;
  setColor: React.Dispatch<React.SetStateAction<string>>;
  setColorId: React.Dispatch<React.SetStateAction<number>>;
  setStorage: React.Dispatch<React.SetStateAction<string>>;
  setStorageId: React.Dispatch<React.SetStateAction<number>>;
}) => (
  <div className="row relative-position align-items-center">
    <div className="col-2 d-none d-lg-flex">
      <div className="gallery">
        {variants?.map((variant, index) => (
          <img
            key={variant.property_id}
            src={variant.image}
            alt={`Variant ${index + 1}`}
            className={`gallery-image ${selectedPropertyId === variant.property_id ? 'selected' : ''}`}
            onClick={() => setSelectedPropertyId(variant.property_id)}
          />
        ))}
      </div>
    </div>
    <div className="col d-none d-lg-flex">
      <div className="product-image">
        {variants?.find(
          (variant) => variant.property_id === selectedPropertyId,
        ) && (
          <img
            src={
              variants?.find(
                (variant) => variant.property_id === selectedPropertyId,
              )?.image
            }
            alt="Product"
          />
        )}
      </div>
    </div>
    <ProductInfo
      product={product}
      color={color}
      storage={storage}
      colorId={colorId}
      storageId={storageId}
      setColor={setColor}
      setColorId={setColorId}
      setStorage={setStorage}
      setStorageId={setStorageId}
    />
  </div>
);

export default ProductDisplay;
