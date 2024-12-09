import React from 'react';
import { useLocation } from 'react-router-dom';
import { ReactSVG } from 'react-svg';

const Header = () => {
  const location = useLocation();

  // Define an array of navigation items
  const navItems = [
    { path: '/plans', label: 'Plans' },
    { path: '/products', label: 'Devices' },
    { path: '/mobile', label: 'Mobile' },
    { path: '/help', label: 'Help' },
  ];

  return (
    <header className="sticky-top">
      <nav className="navbar navbar-expand-lg navbar-light gray-1 d-flex justify-content-between">
        <div className="container">
          <a className="navbar-brand" href="/">
            <ReactSVG src="../../assets/images/logo.svg" className="wrapper" />
          </a>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              {/* Map over the navItems array to generate list items */}
              {navItems.map((item) => (
                <li
                  key={item.path}
                  className={`nav-item ${
                    location.pathname.includes(item.path) ? 'activer' : ''
                  }`}
                >
                  <a
                    className={`nav-link ${
                      location.pathname === item.path
                        ? 'blue-color'
                        : 'dark-blue-color'
                    }`}
                    href={item.path}
                  >
                    {item.label}
                  </a>
                </li>
              ))}
            </ul>
          </div>
        </div>
        <div className="d-flex align-items-stretch header-right">
          <div className="me-4 d-none d-lg-flex align-items-center blue-color sign-in-div">
            <ReactSVG
              src="../../assets/images/user.svg"
              className="wrapper me-2"
            />
            Sign In
          </div>
          <button className="background-blue-color aspect-ratio-one">
            <ReactSVG
              src="../../assets/images/cart.svg"
              className="wrapper-white"
            />
          </button>
          <button
            className="d-lg-none background-dark-blue-color aspect-ratio-one"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <ReactSVG
              src="../../assets/images/menu.svg"
              className="wrapper-white"
            />
          </button>
        </div>
      </nav>
    </header>
  );
};

export default Header;
