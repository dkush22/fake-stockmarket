#Need a sessions controller
#User Model (either Admin or not)
  - User has special access if ADMIN (only associated with one stock)
    - Admin functionalities include:
      - ability to modify/close bank accounts and stock purchasing ability for user

**METHODS:**

user
#Purchase stock
#Sell stock
#Transfer money to friend
#Deposit money to bank account
#Withdraw money from bank account

user(if admin)
#if user has admin privileges, they should be able act on other Users
#can create a new stock

stock
#market cap changes depending on stock price (user investments and sales)
  - random method used to generate increase of stock price

venmo
#can reject transfer if user does not have enough funds

bank account
#cannot be below certain limit ? (does user have ability to borrow?)

sessions
#has some methods


/////
user to user
