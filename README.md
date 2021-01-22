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
  * [overview](#overview-1)
  * [Available data](#available-data)
  * [Request](#requests)
  * [Response](#response)
  * [Errors](#errors)
  

- [Investment API](#investment-api)
  * [overview](#overview-2)
  * [Available data](#available-data-1)
  * [Request](#requests-1)
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


#### examples

We can use cURL to request all campaigns:
```
curl http://localhost:3000/api/v1/campaigns
```

Or to request a specific campaign, with id of 5:
```
curl http://localhost:3000/api/v1/campaigns/5
```

### Response

```json
{"id":1,"name":"Hirthe-Christiansen","image":"https://pigment.github.io/fake-logos/logos/medium/color/2.png","percentage_raised":"215.65","target_amount":922139.12,"sector":"Transportation / Trucking / Railroad","country":"Bhutan","investment_multiple":"9.65"},{"id":2,"name":"Brakus, Jenkins and Goodwin","image":"https://pigment.github.io/fake-logos/logos/medium/color/4.png","percentage_raised":155.0,"target_amount":320170.91,"sector":"E-Learning","country":"Fiji","investment_multiple":"8.92"},{"id":3,"name":"Pouros-Kertzmann","image":"https://pigment.github.io/fake-logos/logos/medium/color/8.png","percentage_raised":74.0,"target_amount":250021.45,"sector":"Railroad Manufacture","country":"Lebanon","investment_multiple":"6.22"},{"id":4,"name":"Raynor-Hayes","image":"https://pigment.github.io/fake-logos/logos/medium/color/1.png","percentage_raised":93.0,"target_amount":627398.49,"sector":"Alternative Medicine","country":"United States of America","investment_multiple":"0.88"},{"id":5,"name":"Friesen, Mills and Wyman","image":"https://pigment.github.io/fake-logos/logos/medium/color/7.png","percentage_raised":"131.25","target_amount":293319.09,"sector":"Performing Arts","country":"Panama","investment_multiple":"7.43"},{"id":6,"name":"Ritchie, Auer and Bogan","image":"https://pigment.github.io/fake-logos/logos/medium/color/4.png","percentage_raised":63.0,"target_amount":767512.34,"sector":"Sporting Goods","country":"Cote d'Ivoire","investment_multiple":"6.25"},{"id":7,"name":"Schneider, Schinner and Krajcik","image":"https://pigment.github.io/fake-logos/logos/medium/color/3.png","percentage_raised":"81.06","target_amount":463503.59,"sector":"Publishing","country":"Eritrea","investment_multiple":"2.73"},{"id":8,"name":"Lehner-Tromp","image":"https://pigment.github.io/fake-logos/logos/medium/color/1.png","percentage_raised":157.0,"target_amount":298843.41,"sector":"Legislative Office","country":"United Kingdom","investment_multiple":"9.86"},{"id":9,"name":"Gerlach Inc","image":"https://pigment.github.io/fake-logos/logos/medium/color/6.png","percentage_raised":32.0,"target_amount":441345.31,"sector":"Pharmaceuticals","country":"Jamaica","investment_multiple":"4.76"},{"id":10,"name":"Langosh-Feeney","image":"https://pigment.github.io/fake-logos/logos/medium/color/13.png","percentage_raised":"349.5","target_amount":560188.11,"sector":"Railroad Manufacture","country":"United Arab Emirates","investment_multiple":"1.14"},{"id":11,"name":"Schuster-Cole","image":"https://pigment.github.io/fake-logos/logos/medium/color/8.png","percentage_raised":129.0,"target_amount":305671.39,"sector":"Railroad Manufacture","country":"Cambodia","investment_multiple":"6.17"},{"id":12,"name":"Kiehn, Flatley and Krajcik","image":"https://pigment.github.io/fake-logos/logos/medium/color/6.png","percentage_raised":33.0,"target_amount":630014.69,"sector":"Machinery","country":"Turkmenistan","investment_multiple":"0.49"},{"id":13,"name":"Batz-Stiedemann","image":"https://pigment.github.io/fake-logos/logos/medium/color/10.png","percentage_raised":100.0,"target_amount":218883.94,"sector":"Utilities","country":"French Polynesia","investment_multiple":"4.86"},{"id":14,"name":"Gusikowski, Zboncak and Stamm","image":"https://pigment.github.io/fake-logos/logos/medium/color/13.png","percentage_raised":54.0,"target_amount":953590.46,"sector":"Computer Hardware","country":"Equatorial Guinea","investment_multiple":"3.31"},{"id":15,"name":"Luettgen-Marks","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":128.0,"target_amount":721622.94,"sector":"Pharmaceuticals","country":"China","investment_multiple":"5.36"},{"id":16,"name":"Erdman Group","image":"https://pigment.github.io/fake-logos/logos/medium/color/6.png","percentage_raised":139.0,"target_amount":155406.35,"sector":"Defense \u0026 Space","country":"Iraq","investment_multiple":"7.88"},{"id":17,"name":"Gutkowski-Dach","image":"https://pigment.github.io/fake-logos/logos/medium/color/5.png","percentage_raised":157.0,"target_amount":570531.27,"sector":"Music","country":"Uzbekistan","investment_multiple":"3.87"},{"id":18,"name":"Wunsch, Kunde and Waelchi","image":"https://pigment.github.io/fake-logos/logos/medium/color/3.png","percentage_raised":49.0,"target_amount":801350.83,"sector":"Aviation \u0026 Aerospace","country":"Iceland","investment_multiple":"7.52"},{"id":19,"name":"Schuppe-Cummings","image":"https://pigment.github.io/fake-logos/logos/medium/color/6.png","percentage_raised":175.0,"target_amount":755296.93,"sector":"Apparel \u0026 Fashion","country":"Venezuela","investment_multiple":"3.21"},{"id":20,"name":"Ullrich, Murray and Bernhard","image":"https://pigment.github.io/fake-logos/logos/medium/color/2.png","percentage_raised":114.0,"target_amount":830287.19,"sector":"Public Policy","country":"United States of America","investment_multiple":"3.86"},{"id":21,"name":"Sporer LLC","image":"https://pigment.github.io/fake-logos/logos/medium/color/2.png","percentage_raised":167.0,"target_amount":934921.04,"sector":"Religious Institutions","country":"Montserrat","investment_multiple":"4.15"},{"id":22,"name":"Leannon-Tillman","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":165.0,"target_amount":366925.77,"sector":"Libraries","country":"Niger","investment_multiple":"1.26"},{"id":23,"name":"Becker-Stiedemann","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":161.0,"target_amount":881270.98,"sector":"Glass, Ceramics \u0026 Concrete","country":"Iran","investment_multiple":"1.94"},{"id":24,"name":"Turner, Wiegand and Cole","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":85.0,"target_amount":315497.39,"sector":"Medical Practice","country":"Iran","investment_multiple":"2.58"},{"id":25,"name":"Koepp, Runolfsson and Breitenberg","image":"https://pigment.github.io/fake-logos/logos/medium/color/1.png","percentage_raised":163.0,"target_amount":465926.87,"sector":"Sports","country":"Bahamas","investment_multiple":"9.37"},{"id":26,"name":"Schinner, Feil and Sanford","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":142.0,"target_amount":453860.68,"sector":"Animation","country":"Georgia","investment_multiple":"1.04"},{"id":27,"name":"Dibbert-Quitzon","image":"https://pigment.github.io/fake-logos/logos/medium/color/10.png","percentage_raised":27.0,"target_amount":597204.92,"sector":"Hospital \u0026 Health Care","country":"Mongolia","investment_multiple":"0.32"},{"id":28,"name":"Grant and Sons","image":"https://pigment.github.io/fake-logos/logos/medium/color/10.png","percentage_raised":133.0,"target_amount":579193.16,"sector":"Logistics and Supply Chain","country":"American Samoa","investment_multiple":"6.83"},{"id":29,"name":"Maggio Group","image":"https://pigment.github.io/fake-logos/logos/medium/color/7.png","percentage_raised":148.0,"target_amount":717423.42,"sector":"Recreational Facilities and Services","country":"Qatar","investment_multiple":"9.31"},{"id":30,"name":"Howe and Sons","image":"https://pigment.github.io/fake-logos/logos/medium/color/12.png","percentage_raised":51.0,"target_amount":367891.83,"sector":"Arts and Crafts","country":"Martinique","investment_multiple":"0.98"},{"id":31,"name":"Swaniawski Inc","image":"https://pigment.github.io/fake-logos/logos/medium/color/12.png","percentage_raised":157.0,"target_amount":293054.15,"sector":"Graphic Design","country":"Honduras","investment_multiple":"5.69"},{"id":32,"name":"Friesen, Friesen and Mertz","image":"https://pigment.github.io/fake-logos/logos/medium/color/9.png","percentage_raised":139.0,"target_amount":706985.52,"sector":"Fine Art","country":"Svalbard \u0026 Jan Mayen Islands","investment_multiple":"6.34"},{"id":33,"name":"Beahan LLC","image":"https://pigment.github.io/fake-logos/logos/medium/color/7.png","percentage_raised":94.0,"target_amount":802402.66,"sector":"Photography","country":"Norfolk Island","investment_multiple":"9.59"},{"id":34,"name":"Hartmann-Collins","image":"https://pigment.github.io/fake-logos/logos/medium/color/12.png","percentage_raised":84.0,"target_amount":505114.61,"sector":"Computer Software","country":"Burkina Faso","investment_multiple":"9.45"},{"id":35,"name":"Kling, Donnelly and Hauck","image":"https://pigment.github.io/fake-logos/logos/medium/color/4.png","percentage_raised":21.0,"target_amount":328634.39,"sector":"Consumer Services","country":"Palestinian Territory","investment_multiple":"7.29"},{"id":36,"name":"Rutherford-Blick","image":"https://pigment.github.io/fake-logos/logos/medium/color/8.png","percentage_raised":112.0,"target_amount":907305.94,"sector":"Higher Education","country":"Faroe Islands","investment_multiple":"6.37"},{"id":37,"name":"Keebler and Sons","image":"https://pigment.github.io/fake-logos/logos/medium/color/10.png","percentage_raised":76.0,"target_amount":262538.52,"sector":"Program Development","country":"Hungary","investment_multiple":"2.18"},{"id":38,"name":"Weissnat-Metz","image":"https://pigment.github.io/fake-logos/logos/medium/color/12.png","percentage_raised":140.0,"target_amount":743620.01,"sector":"Medical Practice","country":"Cyprus","investment_multiple":"9.04"},{"id":39,"name":"Cormier, Reinger and Haag","image":"https://pigment.github.io/fake-logos/logos/medium/color/5.png","percentage_raised":27.0,"target_amount":574667.11,"sector":"Performing Arts","country":"Samoa","investment_multiple":"8.61"},{"id":40,"name":"Casper, Hodkiewicz and Wiza","image":"https://pigment.github.io/fake-logos/logos/medium/color/1.png","percentage_raised":25.0,"target_amount":553591.75,"sector":"Cosmetics","country":"Israel","investment_multiple":"6.11"},{"id":41,"name":"Quigley-Bergstrom","image":"https://pigment.github.io/fake-logos/logos/medium/color/4.png","percentage_raised":129.0,"target_amount":371338.18,"sector":"Arts and Crafts","country":"Saint Helena","investment_multiple":"5.45"},{"id":42,"name":"Lynch-Keeling","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":161.0,"target_amount":848705.28,"sector":"Recreational Facilities and Services","country":"Palau","investment_multiple":"2.38"},{"id":43,"name":"Rogahn, Dietrich and Hudson","image":"https://pigment.github.io/fake-logos/logos/medium/color/8.png","percentage_raised":136.0,"target_amount":106652.93,"sector":"Consumer Services","country":"Luxembourg","investment_multiple":"0.84"},{"id":44,"name":"Herman LLC","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":189.0,"target_amount":512831.76,"sector":"Judiciary","country":"Kyrgyz Republic","investment_multiple":"1.82"},{"id":45,"name":"Johnson and Sons","image":"https://pigment.github.io/fake-logos/logos/medium/color/6.png","percentage_raised":94.0,"target_amount":803370.87,"sector":"Internet","country":"Botswana","investment_multiple":"6.47"},{"id":46,"name":"Sauer, Schmitt and Will","image":"https://pigment.github.io/fake-logos/logos/medium/color/6.png","percentage_raised":136.0,"target_amount":817761.08,"sector":"Packaging and Containers","country":"Norfolk Island","investment_multiple":"8.56"},{"id":47,"name":"Kerluke and Sons","image":"https://pigment.github.io/fake-logos/logos/medium/color/12.png","percentage_raised":42.0,"target_amount":393597.01,"sector":"Information Technology and Services","country":"Guatemala","investment_multiple":"7.25"},{"id":48,"name":"Hartmann, Sporer and Sawayn","image":"https://pigment.github.io/fake-logos/logos/medium/color/6.png","percentage_raised":170.0,"target_amount":367475.01,"sector":"Law Enforcement","country":"Guinea","investment_multiple":"7.92"},{"id":49,"name":"Goodwin-Zboncak","image":"https://pigment.github.io/fake-logos/logos/medium/color/4.png","percentage_raised":"208.32","target_amount":922613.02,"sector":"Program Development","country":"Lebanon","investment_multiple":"5.75"},{"id":50,"name":"Macejkovic-Stokes","image":"https://pigment.github.io/fake-logos/logos/medium/color/11.png","percentage_raised":110.0,"target_amount":915381.62,"sector":"Executive Office","country":"France","investment_multiple":"9.32"}
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

