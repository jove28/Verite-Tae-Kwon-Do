Feature: shopping_cart
  In order to make checkout easier
  a user
  wants to track and see their shopping cart as they add items to it

Background: products in database

  Given the following products exist:
  | name         | price  | active       | image |
  | Banana       |  0.49  | true         |       |
  | Apple        |  0.29  | true         |       |
  | Strawberries |  1.99  | true         |       |

  Scenario: products_page
    Given I am on the products page
    Then  I should see "Products for Sale"
    And   I should see "Banana"

  Scenario: empty_cart
    Given I am on the home page
    When  I follow "cart"
    Then  I should see "There are no items in your shopping cart"

  Scenario: add_to_cart
    Given I am on the products page
    When  I fill in "2" for "product_Banana_quantity"
    And   I press "product_Banana_submit"
    And   I follow "cart"
    Then  I should see "Total Price: $0.98"

  Scenario: update_quantity_to_cart
    Given I am on the products page
    When  I fill in "1" for "product_Banana_quantity"
    And   I press "product_Banana_submit"
    And   I follow "cart"
    And   I fill in "2" for "product_Banana_quantity"
    And   I press "product_Banana_submit"
    And   I follow "cart"
    Then  I should see "Total Price: $0.98"

  Scenario: update_quantity_to_cart_in_shop
    Given I am on the products page
    When  I fill in "1" for "product_Banana_quantity"
    And   I press "product_Banana_submit"
    And   I follow "Shop"
    And   I press "product_Banana_submit"
    And   I follow "cart"
    Then  I should see "Total Price: $0.98"

  Scenario: remove_items_from_cart
    Given I am on the products page
    When  I fill in "1" for "product_Banana_quantity"
    And   I press "product_Banana_submit"
    And   I follow "cart"
    And   I follow "product_Banana_remove"
    And   I follow "cart"
    Then  I should see "There are no items in your shopping cart"

  Scenario: create product
    Given I am on the products page
    When I follow "new product"
    And I fill in "Cheese" for "product_name"
    And I press "Create Product"
    And I follow "Shop"
    Then I should see "Cheese"

  Scenario: create product
    Given I am on the products page
    When I follow "Banana_edit"
    And I fill in "Cheese" for "product_name"
    And I press "Update Product"
    And I follow "Shop"
    Then I should see "Cheese"

  Scenario: destroy product
    Given I am on the products page
    When I follow "Banana_destroy"
    Then I should not see "Banana"

  Scenario: upload file
    Given I am on the products page
    When I follow "Banana_edit"
    And I upload an image "./public/uploads/product/image/2/apple.png"
    And I press "Update Product"
    Then I should not see "Image not found"
