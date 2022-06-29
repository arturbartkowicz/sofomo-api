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

```
git clone https://github.com/arturbartkowicz/sofomo-api.git

cd sofomo-api
```

In the project create a new file in config folder called local_env.yml

```
config/local_env.yml
```

In this file paste a variable:

```
ACCESS_KEY: '<your_access_key>'
```

You can grant your access key form:
https://ipstack.com/product
and choose an option: GET FREE API KEY

ACCESS_KEY in local_env.yml should look like this:

```
ACCESS_KEY: '600dd8989e5001e435fc5ba32febcb41'
```

In .gitignore file paste this line of code:

```
/config/local_env.yml
```

<br>

### Build the app

Boot the app with docker compose up:

```
docker compose up
```

In another terminal create the database:

```
docker compose run web rake db:create
```

Open docker interactive console:

```
docker exec -it sofomo-api_web_1 /bin/bash
```

Run pending migrations in docer interactive console:

```
bin/rails db:migrate RAILS_ENV=development
```

## Using the app

Test application APIs Using Insomnia REST Client or other.
<br><br>

### POST request

create POST request to the endpoint:

http://localhost:3000/api/v1/geolocations

As JSON body pass an <code>ip</code>. An ip below is just an example.

```
{
  "ip_address": "46.250.21.63"
}
```

You should receive a response:

```
{
  "id": 1,
  "ip_address": "46.250.21.63",
  "location": "Odessa",
  "created_at": "2022-06-29T08:37:37.976Z",
  "updated_at": "2022-06-29T08:37:37.976Z"
}
```

<br>

### GET request

Create GET request to the endpoint:

http://localhost:3000/api/v1/geolocations

Response should receive an array of objects similar like POST request.
<br><br>

### DELETE request

Create DELETE request to the endpoint:

http://localhost:3000/api/v1/geolocations/ip

As JSON body pass an <code>ip</code> which you want to delete.
Below JSON body example:

```
{
  "ip_address": "46.187.21.60"
}
```

<br>

## Running tests

Open a new terminal and in the project folder open docker interactive console:

```
docker exec -it sofomo-api_web_1 /bin/bash
```

In the docker interactive console run all the test with the rspec command:

```
rspec
```
