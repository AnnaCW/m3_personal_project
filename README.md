### [Musical Memory](http://musicalmemory.herokuapp.com/)

#### Anna Weisbrodt - Turing School of Software and Design - Module 3 - Personal Project


#### Introduction:
Musical Memory was inspired by research suggesting that people suffering with Alzheimer's Disease and dementia may respond positively to music, especially music they enjoyed in the past and/or experienced during childhood and young adulthood. Using the Spotify API, Musical Memory enables caregivers and researchers to easily find music that is likely to resonate with an individual based on category, genre, or decade. The app also recommends additional tracks based on the current track selection. The user can create a "listening session" to record the response to a particular track or playlist. An admin user can also export all listening session data to a CSV file.

#### Concepts:

* API Consumption
* API Creation
* Testing APIs
* Authentication with OmniAuth
* Authorization
* Caching

#### Platforms:
* Ruby

#### Dependencies:
* Rails 5.0.0
* PostgreSQL
* jQuery
* OmniAuth-OAuth2
* VCR
* Webmock
* RSpec
* Capybara
* Shoulda Matchers
* Factory Girl
* Faraday
* Figaro
* Bootstrap-Sass

#### Setup:
* Clone down the repository
* ``` cd ``` into the repository  
* ``` bundle ```
* ``` rake db:create```
* ``` rake db:schema:load```

#### To run the test suite:

``` rspec ```

#### Production:

[Musical Memory](http://musicalmemory.herokuapp.com/)

#### React:

This [branch](https://github.com/AnnaCW/m3_personal_project/tree/react-dev-1) converts many of the views to React. This [blog post](https://medium.com/@aweisbro/react-in-rails-notes-from-a-novice-9150dac7c796#.li9x05kjf) documents this process. 
