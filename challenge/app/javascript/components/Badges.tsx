import React from 'react';

const Badges = ({
  isNew,
  stock,
  discount,
}: {
  isNew: boolean;
  stock: number;
  discount: number;
}) => (
  <div className="mb-2">
    {isNew && <span className="badge new-button">New</span>}
    {stock === 0 && <span className="badge sold-out-button">Sold Out</span>}
    {discount && <span className="badge discount-button">{discount}% off</span>}
  </div>
);

export default Badges;
