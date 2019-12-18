# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## What it does

- A shopping website where a user, regardless if logged in or not, can add items to their cart and purchase the item using stripe

## Photos

!["Index Page"](/docs/products_page.png)
!["Item Description"](/docs/items_description.png)
!["Cart Checkout"](/docs/my_cart.png)
!["Category summary for admins"](/docs/category_admin.png)

## How it works

- A user can choose to log in
- The user can scroll through available products and add whatever item to their cart they want
- If the item is sold out, a notification will show
- When the user is done adding to the car, a user can checkout using Stripe
- Admins can log in to add products and new categories

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
