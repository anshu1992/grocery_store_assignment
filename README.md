# Grocery Store App
Code test creating a grocery store app in Ruby on Rails

Objective:
Complete as many tasks as you can. You do NOT need to complete every single task so if you get stuck, please reach out. We are happy to help. This isn't a pass or fail test, it will give us an idea where you are as a developer. There are *Bonus* objectives. Please feel free to complete those even if you haven't completed all the other tasks.

Overview: 
This is a grocery store app. Think about your grocery store and go from there. You need to create an app that will at the very least do the following:
  1. Allow a user to sign in and have an account
  2. Be able to add products to their cart
  3. Have multiple routes (home, my_account, admin, sign in, sign up, cart, checkout, payment, etc...)
  4. See a running total of what is in their cart
  5. Apply coupons/discount codes to a product
  6. Checkout with a fake payment

Tasks: 
1. Create a User table that has these fields:
  - First name *required
  - Last name *required
  - Email *required
  - Phone number *required
  - Birthdate
  - Address
  - City
  - Zip code
  - State

2. Create a Category table that has these fields:
  - Produce
  - Dairy
  - Bakery
  - Deli

3. Create a Product table that should belong to a Category with these fields:
  - Title
  - Description
  - Picture
  - Price
  
  The products should be populated with these at a minimum but feel free to add more:
  - Produce
    - Broccoli
    - Lettuce
    - Carrots
    - Bananas
    - Apples
    - Grapes
    - Oranges
    - Watermelon
    - Squash
    - Peppers
    - Potatos
  - Dairy
    - Milk
    - Cheese
    - Butter
    - Buttermilk
    - Eggs
    - Heavy Cream
    - Almond Milk
  - Bakery
    - Rolls
    - Cookies
    - Cake
    - Bread
    - French Loaf
    - Cupcakes
    - Doughnuts
    - Bagles
  - Deli
    - Sliced Ham
    - Sliced Chicken
    - Sliced Turkey
    - Sliced Cheddar Cheese
    - Sliced Pepperjack Cheese
    - Sliced Provolone Cheese
    - Sliced Swiss Cheese

4. Create an Admin portal for an admin to create, update, or delete any Products and assign them to Categories and create, update or delete Coupon/Discount codes

5. Create a Coupon/discount code mananger feature. You can create one from scratch or you can impliment a gem. This feature shoudl allow an Admin to set a discount for a product until a specific date. The user should see that the Product has a coupon/discount and be able to click a button to "Apply Coupon" in their cart. This should change the total of the price for that item to the coupon/disounted price and their total should change as well.

6. Create a Sign up/in page for a user to create an account and sign in

7. Create a home page for a User to browse through the products and see each Product with it's title, description, picture and price. This should include all the products.

8. Use a deisgn library to make your app look good with the least amount of effort. You can use whichever library you prefer. 

9. Create a feature that you can search and/or filter by category or product title 

10. Create a Shopping cart feature that will allow a User to add Products and remove Products from their cart

11. Create a Checkout page that will allow a user to see everything in their cart along with their total price. Allow the user to remove items from their cart as well as "check out"

12. Set up a fake payment process to allow the user to "Check out"

13. Provide some kind of user feedback that they have successfully check out and their order has been received and will be processed soon. 


*BONUS*
Remember these are bonus features. You should work to complete as many of the tasks above first but if you're stuck and want to add some of these, that is fine.

1. Use Vue as your frontend
2. Write tests to make sure you can add, remove and update products
3. Create a Order History table and save the User's orders
4. Create a "Quick Order" feature that would allow a User to name an order and select that order to populate their cart with all the Products in that selected order.
5. Add some fun feedback for the User when they successfully checkout. Maybe some confetti, thumbs up emoji, or a dancing grandma gif, etc... Make the user experience fun and enjoyable
6. Add some Easter Eggs to make the shopping experience unique. One idea would be if the user selects certain products in a certain order they get their order for free, or if a user is only selecting healthy food, you reward them with free Lettuce or something. Feel free to add some fun things to the app as well as your code. We have fun here so we like to see you having fun too!
