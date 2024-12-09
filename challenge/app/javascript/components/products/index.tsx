// Products.tsx
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../Header';
import Footer from '../Footer';
import ProductCard from './ProductCard';
import { Product } from '../shared';

const Products = () => {
  const navigate = useNavigate();
  const [products, setProducts] = useState<Product[]>([]);
  const [page, setPage] = useState(1);
  const perPage = 16;
  const [hasMore, setHasMore] = useState(true);
  const [productCount, setProductCount] = useState(0);

  useEffect(() => {
    fetchProducts();
  }, [page]);

  useEffect(() => {
    fetchProductsCount();
  }, []);

  const fetchProducts = () => {
    const url = `/api/v1/products/index?page=${page}&per_page=${perPage}`;
    fetch(url)
      .then((res) => {
        if (res.ok) {
          return res.json();
        }
        throw new Error('Network response was not ok.');
      })
      .then((res) => {
        setProducts([...products, ...res.products]);
        setHasMore(res.has_more);
      })
      .catch(() => navigate('/'));
  };

  const fetchProductsCount = () => {
    const url = `/api/v1/products/count`;
    fetch(url)
      .then((res) => {
        if (res.ok) {
          return res.json();
        }
        throw new Error('Network response was not ok.');
      })
      .then((res) => {
        setProductCount(res);
      })
      .catch(() => navigate('/'));
  };

  const loadMore = () => {
    setPage(page + 1);
  };

  const allProducts = products.map((product) => (
    <ProductCard product={product} />
  ));

  return (
    <>
      <Header />
      <section className="jumbotron jumbotron-fluid text-left">
        <div className="container py-3">
          <h1 className="display-4">Mobile Phones</h1>
          <p className="lead product-count">Displaying {productCount} items</p>
        </div>
      </section>
      <main className="container">
        <hr className="my-4" />
        <div className="row g-2">{allProducts}</div>
        <div className="d-flex justify-content-center pt-4 pb-4">
          {hasMore && (
            <button
              id="load-more-button"
              onClick={loadMore}
              className="btn btn-primary load-more-button"
            >
              Load More
            </button>
          )}
        </div>
      </main>
      <Footer />
    </>
  );
};

export default Products;
