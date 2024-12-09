import React, { useEffect, useState } from 'react';
import { ProductWithVariants } from './shared';

const Carousel = ({ product }: { product: ProductWithVariants }) => {
  const [currentSlide, setCurrentSlide] = useState(0);

  const handleNext = () => {
    setCurrentSlide(
      currentSlide === product.variants.length - 1 ? 0 : currentSlide + 1,
    );
  };

  const handlePrev = () => {
    setCurrentSlide(
      currentSlide === 0 ? product.variants.length - 1 : currentSlide - 1,
    );
  };
  useEffect(() => {}, [currentSlide]);

  return (
    <div
      id="carouselExampleControls"
      className="carousel slide"
      data-bs-ride="carousel"
    >
      <div className="carousel-inner">
        {product.variants?.map((variant, index) => (
          <div
            key={variant.property_id}
            className={`carousel-item ${
              index === currentSlide ? 'active' : ''
            }`}
          >
            <img
              className="d-block w-100 carousel-img"
              src={variant.image}
              alt={`Product ${index + 1}`}
            />
          </div>
        ))}
      </div>
      <button
        className="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleControls"
        data-bs-slide="prev"
        onClick={handlePrev}
      >
        <span className="carousel-control-prev-icon" aria-hidden="true"></span>
        <span className="visually-hidden">Previous</span>
      </button>
      <button
        className="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleControls"
        data-bs-slide="next"
        onClick={handleNext}
      >
        <span className="carousel-control-next-icon" aria-hidden="true"></span>
        <span className="visually-hidden">Next</span>
      </button>
      <div className="carousel-indicators carousel-indicators-container">
        {product.variants?.map((variant, index) => (
          <button
            key={variant.property_id}
            type="button"
            data-bs-target="#carouselExampleControls"
            data-bs-slide-to={index}
            aria-current={index === currentSlide ? 'true' : 'false'}
            className={
              index === currentSlide
                ? 'active background-black-color carousel-indicator-button'
                : 'background-gray-color smaller1vw carousel-indicator-button'
            }
            onClick={() => setCurrentSlide(index)}
          >
            <span className="carousel-indicator-dot"></span>
          </button>
        ))}
      </div>
    </div>
  );
};

export default Carousel;
