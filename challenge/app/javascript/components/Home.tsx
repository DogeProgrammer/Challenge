import React from 'react';
import { Link } from 'react-router-dom';

export default function Home() {
  return (
    <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
      <div className="jumbotron jumbotron-fluid bg-transparent">
        <div className="container secondary-color">
          <h1 className="display-4">Mobile Devices</h1>
          <p className="lead">A curated list of devices.</p>
          <hr className="my-4" />
          <Link
            to="/products"
            className="btn btn-lg custom-button"
            role="button"
          >
            View Products
          </Link>
        </div>
      </div>
    </div>
  );
}
