/// <reference types="cypress" />

describe('Products Page', () => {
  it('Load More button adds cards', () => {
    cy.visit('http://localhost:3000/products');

    cy.get('.product-card')
      .its('length')
      .then((initialCardCount) => {
        cy.get('#load-more-button').click();

        cy.wait(500);

        cy.get('.product-card').should('have.length', initialCardCount + 16);
      });
  });

  it('Clicking a product card redirects to the product page', () => {
    cy.visit('http://localhost:3000/products');

    cy.get('.product-card').first().click();

    cy.url().should('include', '/products/');
  });
});
