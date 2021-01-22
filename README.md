# MiniSeedrs

## Overview

MiniSeedrs allows you to easily invest in business you believe in. Build your application to connect to our investment platform through our:

* **Campaigns API** - instant access to investment opportunities
* **Investment API** - instant investment initiation

Our products provide an unified interface between our investment platform and third party applications over a common [RESTful API](https://en.wikipedia.org/wiki/Representational_state_transfer).

## Getting started

### Installation

To get started with the app, first clone the repo and `cd` into the directory:

```
$ git https://github.com/filippomassarelli/mini-seedrs.git 
$ cd mini-seedrs
```

Then install the gems required:

```
$ bundle install
```

Make sure the database is created:

```
$ rails db:create
```

Next, migrate the schema:

```
$ rails db:migrate
```

And load the initial data:

```
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```





**Show User**
----
  Returns json data about a single user.

* **URL**

  /users/:id

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ id : 12, name : "Michael Bloom" }`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "User doesn't exist" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/users/1",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```
