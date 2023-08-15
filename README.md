# Overview

Lunch and Learn is a Ruby on Rails back-end application that exposes APIs
This app will allow users to explore cuisines by country, searching recipes, favoriting items, and learning about different cultures. It incorporates CRUD functionality, authentication, and integration with external APIs.   Working within a service-oriented architecture, the back-end developer's role is to facilitate API communication between the front-end.

## Table of Contents
- [Learning Goals](#learning-goals)
- [How To Install](#how-to-install)
- [Endpoints](#endpoints)
- [Tech Stack](#tech-stack)

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Implement Basic Authentication
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## How To Install

- Fork and clone this repo
- Run `bundle install`
- Run `rails db:{create,migrate,seed}`
- `bundle exec rspec` to run the test suite
- To run this server, type command ```rails s``` in the terminal
- To stop the local server, type command ```ctl + c```<br><br>
-  Sign up for the following free APIs:<br>
  [REST Countries API](https://restcountries.com/) | [Edamam API](https://developer.edamam.com/edamam-recipe-api) | [Youtube API](https://developers.google.com/youtube/v3/getting-started) | [Unsplash API](https://unsplash.com/developers)


 ## Endpoints
Base url used (http://localhost:3000)

  <details>
<summary>route: GET /api/v1/recipes?country="name"</summary><br>
Get Recipes For A Particular Country -- searching for cuisines by country. Example data:

    {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {etc...},
      ]
    }

If the country parameter is an empty string it should return an empty array

    {
      "data": []
    }

  </details>

<details>
<summary>route: GET /api/v1/learning_resources?country=""</summary>
Get Learning Resources for a Particular Country -- include videos about that country's culture and images. Example data:

    {
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples",
                    "url": "https://images.unsplash.com/photo-1528181304..."
                },
                {etc...},
              ]
        }
      }
    }

If no videos or images are found, those keys should point to an empty object:

    {
      "data": {
          "id": null,
          "type": "learning_resource",
          "attributes": {
              "country": "laos",
              "video": {},
              "images": []
          }
      }
    }

</details>

- User Registration endpoint: `POST /api/v1/users`
- User Log In endpoint: `POST /api/v1/sessions`
- Add Favorite Recipes endpoint: `POST /api/v1/favorites`
- Get User Favorites endpoint: `GET /api/v1/favorites?api_key=<key>`

## Tech Stack

- This project used Rails 7.0, Ruby 3.1.1, and PostgreSQL
- Gems utilized: <br> *rspec-rails, capybara, shoulda-matchers, orderly, launchy, bcrypt, <br> jsonapi-serializer, faraday, figaro, simplecov, VCR*
- More details about the project and its requirements can be found [here](https://backend.turing.edu/module3/projects/lunch_and_learn/index)
