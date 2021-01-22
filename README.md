# Mini Seedrs

## Introduction

### Overview

Mini Seedrs allows you to easily invest in business you believe in. Build your application to connect to our investment platform through our:

* **Campaign API** - instant access to investment opportunities
* **Investment API** - instant investment initiation

Our products provide an unified interface between our investment platform and third party applications over a common [RESTful API](https://en.wikipedia.org/wiki/Representational_state_transfer).

Make sure to read the installation guide and API documentation below. 

Thank you supporting the next generation of businesses !

### Contents

- [Get started](#get-started)
  * [Prerequisites](#prerequisites)
  * [Install](#install)
  * [Test](#test)
  * [Run](#run)
  
- [Campaign API](#campaign-api)
  * [Overview](#overview-1)
  * [Available data](#available-data)
  * [Request](#request)
   + [API endpoint](#api-endpoint)
   + [HTTP verbs](#http-verbs)
   + [Params](#params)
   + [Example request](#example-request)
  * [Response](#response)   
   + [Success](#success)
   + [Error](#error)
  

- [Investment API](#investment-api)
  * [Overview](#overview-2)
  * [Available data](#available-data-1)
  * [Request](#request-1)
   + [API endpoint](#api-endpoint-1)
   + [HTTP verbs](#http-verbs-1)
   + [Params](#params-1)
   + [Example request](#example-request-1)
  * [Response](#response-1)
   + [Success](#success-1)
   + [Error](#error-1)
  * [Errors](#errors-1)



## Get started

### Prerequisites

Before you start, open your terminal and check whether you have rails installed on your machine:
```
$ rails -v
Rails 6.1.1
```

If not, follow the [Rails Guides](https://guides.rubyonrails.org/v5.0/getting_started.html) to install the latest version of rails.

We will also be using [cURL](https://curl.se/) to make HTTP requests to our API from the terminal, so make sure you have it:
```
$ curl --version
curl 7.54.0
```

If not, follow this [installation guide](https://curl.se/download.html).



### Install

To get started with the app, clone the repo and `cd` into the directory:
```
git clone https://github.com/filippomassarelli/mini-seedrs.git --master
cd mini-seedrs
```

Then install the gems required:
```
bundle install
```

Make sure the database is created:
```
rails db:create
```

Next, migrate the schema:
```
rails db:migrate
```

Finally, load the initial data:
```
rails db:seed
```

### Test

We use [RSpec](https://rspec.info/), a Ruby testing tool created for behavior-driven development (BDD). 

Run the test suite to verify that everything is working correctly:

```
rspec
```

### Run

If the test suite passes, you'll be ready to run the app in a local server:

```
rails server
```

Port 3000 is used by default.

---


## Campaign API

### Overview

The Mini Seedrs Campaign API is a single interface to access current and past investment opportunities (campaigns) on the Mini Seedrs investment platform. 


### Available data

The Campaign API allows you to access the following data for when listing all campaigns:
* `id` (integer): The unique id for the campaign
* `name` (string): The name of the business running the campaign
* **image** (string): The url path of the logo of the business
* **percentage_raised** (float): The percentage raised based on the investment target
* **target_amount** (float): The investment target of the campaign 
* **sector** (string): The industry sector in which the business operates
* **country** (string): The country where the business is based
* **investment_multiple** (decimal): The investment multiple for the campaign to accepting new investment

For single campaigns the Campaign API will also allow you to access:
* **investment_count** (integer): The number of valid investments made for that campaign
* **is_open** (boolean): A statement indicating whether the campaign is currently open for investment

### Request

#### API endpoint

The local server is set to run on Port 3000 by default, and the api is versioned. The current version is ```v1``` which results in the base URL for all requests:
```
http://localhost:3000/api/v1/campaigns
```


#### HTTP verbs

The Campaign API v1 supports only the `READ` functionality:

| Verb | Description |
| --- | ---- |
| `GET` | Retrieve one or multiple resources |


#### Params

The **GET** request does not require body params to be specified nor a header.

In order to access single campaign records however, the campaign id is needed as **URI params** as such:
```
http://localhost:3000/api/v1/campaigns/{campaign_id}
```


#### Example request

We can use cURL to request all campaigns:
```
curl http://localhost:3000/api/v1/campaigns
```

If we want to request only the campaign with id of 5:
```
curl http://localhost:3000/api/v1/campaigns/5
```


### Response

#### Success

A successful request for all campaigns should be followed by a response similar to:
```json
[
 {
  "id":1,
  "name":"Hirthe-Christiansen",
  "image":"https://pigment.github.io/fake-logos/logos/medium/color/2.png","percentage_raised":"215.65","target_amount":922139.12,"sector":"Transportation / Trucking / Railroad",
  "country":"Bhutan",
  "investment_multiple":"9.65"
 },
 ...,
 {
  "id":50,
  "name":"Macejkovic-Stokes",
  "image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png",
  "percentage_raised":110.0,
  "target_amount":915381.62,
  "sector":"Executive Office",
  "country":"France",
  "investment_multiple":"9.32"
 }
]
```

Whereas following a successful request for a single campaign you should expect:
```json
{
 "id":5,
 "name":"Friesen, Mills and Wyman",
 "image":"https://pigment.github.io/fake-logos/logos/medium/color/7.png","percentage_raised":"131.25","investment_count":2,"target_amount":293319.09,"sector":"Performing Arts",
 "country":"Panama",
 "investment_multiple":"7.43",
 "is_open":true
}
```

#### Error



---


## Investment API


### Overview

The Mini Seedrs Investment API brings the investment functionality to our platform. Using the API, you can execute investments to any campaign that is open for investment on our platform.


### Available data



### Request


#### API endpoint

The Investment API follows the same versioned structure as the Campaigns API, resulting in the following base URL:
```
http://localhost:3000/api/v1/investments
```


#### HTTP verbs

The Investment API v1 only supports the `CREATE` functionality:

| Verb | Description |
| --- | ---- |
| `POST` | Make an investment into a campaign |


#### Params

The POST request needs a header of ```Content-Type: application/json``` and the following data passed in the body of the request:

Field | Required | Description
--- | --- | ---
`user_name` | No | The name of the investor is optional in this API version 
`investment_amount` | Yes | The amount to be invested is required for a successful request
`currency` | Yes | The currency of investment needs to be specified
`campaign_id` | Yes | To invest in a campaign, its id needs to be provided


#### Example request
```
curl --header "Content-Type: application/json" --request POST --data '{"user_name":"Filippo Massarelli", "investment_amount": 1000, "currency":"GBP", "campaign_id":5}' http://localhost:3000/api/v1/investments
```


### Response


#### Success

If your request is successful you will receive a ```201``` ```Created``` status code back as an HTTP response. 

The new investment is saved in the database and returned in the response. Thus you may expect:
```
{
 "status":"SUCCESS 201",
 "message":"Valid investment: Thank you for supporting the wonderful!",
 "data":
  {
   "id":7,
   "user_name":"Filippo Massarelli",
   "investment_amount":"7430.0",
   "currency":"GBP",
   "created_at":"2021-01-22T13:22:23.341Z",
   "updated_at":"2021-01-22T13:22:23.341Z",
   "campaign_id":5
  }
}
```


#### Error

If your investment is invalid you will receive one of the ```4XX``` ```Client Error``` codes below:

| HTTP Status Code | Description |
| --- | ---- |
| ```403``` ```Forbidden``` | The investment amount did not respect the campaign's investment multiple. For reference, the investment multiple of the campaign is returned in the error message |
| ```404``` ```Not Found``` | A campaign with the specified id does not exist |
| ```406``` ```Not Acceptable``` | The investment was rejected, either because the investment was not in GBP or because the campaign was no longer open. This is specified in the error message |
| ```422``` ```Unprocessable Entity``` | The server was unable to process the contained instructions for reasons other than the above. The error appearing in the server is passed in the response |






