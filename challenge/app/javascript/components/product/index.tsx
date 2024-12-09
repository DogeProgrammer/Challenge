import React, { useState, useEffect } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import Header from '../Header';
import Footer from '../Footer';
import ProductDisplay from './ProductDisplay';
import { Product, ProductWithVariants } from '../shared';

const Product = () => {
  const ProductDetail = () => {
    const params = useParams();
    const navigate = useNavigate();
    const [product, setProduct] = useState<ProductWithVariants>({});
    const [selectedPropertyId, setSelectedPropertyId] = useState(0);
    const [color, setColor] = useState('');
    const [colorId, setColorId] = useState(0);
    const [storage, setStorage] = useState('');
    const [storageId, setStorageId] = useState(0);

    useEffect(() => {
      const fetchProduct = async () => {
        try {
          const response = await fetch(`/api/v1/products/show/${params.id}`);
          if (!response.ok) {
            throw new Error('Network response was not ok.');
          }
          const data = await response.json();
          setProduct(data);
          setColor(data.colors[0]?.value);
          setColorId(data.colors[0]?.id);
          setStorage(data.storage[0]?.value);
          setStorageId(data.storage[0]?.id);

          if (data.variants && data.variants.length > 0) {
            setSelectedPropertyId(data.variants[0].property_id);
          }
        } catch (error) {
          navigate('/products');
        }
      };
      fetchProduct();
    }, [params.id, navigate]);

    return (
      <>
        <main className="container">
          <div className="pt-2 mb-4">
            <div className="product-details-link">
              <Link to="/products" className="no-text-decoration gray-color">
                Mobile Phones /
              </Link>
              <div className="black-color">
                {product.brand} {product.name}
              </div>
            </div>
            <ProductDisplay
              variants={product.variants}
              selectedPropertyId={selectedPropertyId}
              setSelectedPropertyId={setSelectedPropertyId}
              color={color}
              colorId={colorId}
              storage={storage}
              storageId={storageId}
              product={product}
              setColor={setColor}
              setColorId={setColorId}
              setStorage={setStorage}
              setStorageId={setStorageId}
            />
          </div>
        </main>
      </>
    );
  };

  return (
    <>
      <Header />
      <ProductDetail />
      <Footer />
    </>
  );
};

export default Product;
