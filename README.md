# MiniSeedrs

## Introduction

### Overview

MiniSeedrs allows you to easily invest in business you believe in. Build your application to connect to our investment platform through our:

* **Campaign API** - instant access to investment opportunities
* **Investment API** - instant investment initiation

Our products provide an unified interface between our investment platform and third party applications over a common [RESTful API](https://en.wikipedia.org/wiki/Representational_state_transfer).

Make sure to read the installation guide and API documentation below. 

Thank you supporting the next generation of businesses !

### Contents

- [Get started](#get-started)
  * [Install](#install)
  * [Test](#test)
  * [Run](#run)
  
- [Campaign API](#campaign-api)
  * [Overview](#overview-1)
  * [Available data](#available-data)
  * [Request](#request)
  * [Response](#response)
  * [Errors](#errors)
  

- [Investment API](#investment-api)
  * [Overview](#overview-2)
  * [Available data](#available-data-1)
  * [Request](#request-1)
  * [Response](#response-1)
  * [Errors](#errors-1)



## Get started

### Before you start

First open your terminal and check whether you have rails installed on your machine:
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


## Campaign API

### Overview

The Mini Seedrs Campaign API is a single interface to access current and past investment opportunities (campaigns) on the Mini Seedrs investment platform. 


### Available data

The Campaign API allows you to access the following data for when listing all campaigns:
* **id** (integer): The unique id for the campaign
* **name** (string): The name of the business running the campaign
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

As the local server is set to run on Port 3000, the api is accessible via ```http://localhost:3000/api```, and the current version is ```v1``` which results in the base URL for all requests:
```
http://localhost:3000/api/v1
```

#### HTTP verbs

The Campaign API v1 is **READ** only:

| Verb | Description |
| --- | ---- |
| **GET** | Retrieve one or multiple resources |


#### Example 

We can use cURL to request all campaigns:
```
curl http://localhost:3000/api/v1/campaigns
```

Or to request a specific campaign, with id of 5:
```
curl http://localhost:3000/api/v1/campaigns/5
```


### Response

Following the request for all campaigns you should expect a response similar to:

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

Whereas for the single campaign you shouls expect:
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

### Errors
  

## Investment API

### Overview

The Mini Seedrs Investment API brings the investment functionality to our platform. Using the API, you can execute investments to any campaign that is open for investment on our platform.

### Available data

### Request

### Response

### Errors

If your investment is invalid you will not receive a ```201``` ```Created``` status code back as an HTTP response. 

Instead you will receive one of the ```4XX``` ```Client Error``` codes below:

| HTTP Status Code | Description |
| --- | ---- |
| ```403``` ```Forbidden``` | The investment amount did not respect the campaign's investment multiple |
| ```404``` ```Not Found``` | The campaign id was not found |
| ```406``` ```Not Acceptable``` | The investment was rejected, either because the investment was not in GBP or because the campaign was closed |
| ```422``` ```Unprocessable Entity``` | The server was unable to process the contained instructions for reasons other than the above |

