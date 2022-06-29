# README

## Rails API + Docker app

Simple Rails API application able to store geolocation data in the database, based on IP address.

Obtaining geolocation data using https://ipstack.com/

An API is able to make a POST request, providing an ip address and return geolocation name based on it. List all created geolocations, and delete them.<br><br>

## Tech stack

- PostgreSQL
- Ruby on Rails
- Ruby
- Docker<br><br>

## Running this app

You'll need to have Docker installed.

Clone this repo anywhere you want and move into the directory:

<code>

    git clone https://github.com/arturbartkowicz/sofomo-api.git

    cd sofomo-api

</code>

In the project create a new file in config folder called local_env.yml

<code>

    config/local_env.yml

</code>

In this file paste a variable:

<code>

    ACCESS_KEY: '<your_access_key>'

</code>

You can grant your access key form:
https://ipstack.com/product
and choose an option: GET FREE API KEY

ACCESS_KEY in local_env.yml should look like this:

<code>

    ACCESS_KEY: '600dd8989e5001e435fc5ba32febcb41'

</code>

In .gitignore file paste this line of code:

<code>

    /config/local_env.yml

</code>
<br>

### Build the app

Boot the app with docker compose up:

<code>

    docker compose up

</code>

In another terminal create the database:

<code>

    docker compose run web rake db:create

</code>

Open docker interactive console:

<code>

    docker exec -it sofomo-api_web_1 /bin/bash

</code>

Run pending migrations in docer interactive console:

<code>

    bin/rails db:migrate RAILS_ENV=development

</code>

## Using the app

Test application APIs Using Insomnia REST Client or other.
<br><br>

### POST request

create POST request to the endpoint:

http://localhost:3000/api/v1/geolocations

with JSON body where you can pass an ip. An ip below is just an example.

<code>

    {
      "ip_address": "46.250.21.63"
    }

</code>
You should receive a response:
<code>
  
	{
      "id": 1,
	  "ip_address": "46.250.21.63",
	  "location": "Odessa",
	  "created_at": "2022-06-29T08:37:37.976Z",
	  "updated_at": "2022-06-29T08:37:37.976Z"
    }
</code>
<br>

### GET request

Create GET request to the endpoint:

http://localhost:3000/api/v1/geolocations

Response should receive an array of objects similar like POST request
<br><br>

### DELETE request

Create DELETE request to the endpoint:

http://localhost:3000/api/v1/geolocations/[:id]

As a id pass a value of the id object which you would like to delete
<br><br>

## Running tests
