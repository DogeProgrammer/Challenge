/// <reference types="cypress" />

describe('Homepage', () => {
  it('should verify elements on Homepage', () => {
    cy.visit('http://localhost:3000');

    cy.get('h1').should('contain.text', 'Mobile Devices');
    cy.get('p').should('contain.text', 'A curated list of devices.');
    cy.get('a').should('contain.text', 'View Products');

    cy.get('a').contains('View Products').click();

    cy.url().should('include', '/products');

    cy.get('p.lead', { timeout: 1000 }).should(
      'contain.text',
      'Displaying 40 items',
    );
  });
});
