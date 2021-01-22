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
  * [overview](#overview)
  * [Available data](#available-data)
  * [Request](#requests)
  * [Response](#response)
  * [Errors](#errors)
  

- [Investment API](#investment-api)
  * [overview](#overview)
  * [Available data](#available-data)
  * [Request](#requests)
  * [Response](#response)
  * [Errors](#errors)



## Get started

### Before you start

First open your terminal and check whether you have rails installed on your machine:
```
$ rails -v
Rails 6.1.1
```

If not, follow the [Rails Guides](https://guides.rubyonrails.org/v5.0/getting_started.html) to install the latest version of rails.


### Install

To get started with the app, first open your terminal, clone the repo and `cd` into the directory:
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

### overview

### Available data

### Request

### Response

### Errors
  

## Investment API

### overview

### Available data

### Request

### Response

### Errors

If your investment is invalid you will not receive a **201 - Created** status code back as a response. 

Instead you will receive one of the **4XX - Client Error** codes below:

| HTTP Status Code | Description |
| --- | ---- |
| 403 - Forbidden | The investment amount did not respect the campaign's investment multiple |
| 404 - Not Found | The campaign id was not found |
| 406 - Not Acceptable | The investment was rejected, either because the investment was not in GBP or because the campaign was closed |
| 422 - Unprocessable Entity | The server was unable to process the contained instructions for reasons other than the above |

