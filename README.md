# Keycloak Sample Application

This is a sample application that provides a simple demonstration of using Keycloak as an I&AM provider for a Scala web app.

## Keycloak Setup
 
Run the Keycloak container and Postgres container from the `docker-compose/` folder by navigating to that folder and running `docker-compose up -d`. To tear down these instances later, simply run `docker-compose rm -fs` from the same location.

Steps 1 - 3 describe how to configure settings that are saved in the `docker-compose/pg-dumps/keycloak-dump.sql` file, which is used to seed the `docker-compose` Keycloak instance. Skip to step 4 if you simply want to use the seeded configuration.

(1) Log in

Navigate to `http://localhost:8080/auth`.  Username/password are both "keycloak". 

(2) Create a new realm

- Use the top left menu named `Master` with a dropdown arrow.  A mouseover will reveal `Add Realm`.  Select it.
- Choose the name `demo`, click `Create`
- Navigate to the `Login` tab and turn `User registration`, `Email as username`, `Forgot password` and `Remember Me` on

(3) Add a client to this realm

- The top left Menu should say `demo` instead of `Master`. You are now in the `Demo` realm.  Click `Clients` on the left-hand menu
- On the far right-hand side, click the `Create` button
- For the `Client ID`, enter `test-client`
- Leave the `Client Protocol` as `openid-connect`
- Click `Save`
- Under `Access Type` select `confidential`
- Add a redirect uri of `urn:ietf:wg:oauth:2.0:oob` under `Valid Redirect URIs`
  - This is a special uri that tells Keycloak to display the authorization code to the user for them to copy and paste into a given application
  - We can use this for logging in via Postman
  - If we were hosting an actual service we would put input the callback uri of our service where we want to receive token info
- Click `Save`
- Navigate to the new `Credentials` tab for `test-client`
- Click `RegenerateSecret`
- Copy this value down, it will be needed for login
  
(4) Create a user

- Visit the login page for the `demo` realm [here](http://localhost:8085/auth/realms/demo/account/)
- Click `Register` and fill out the appropriate information

(5) Logout after registration and proceed to the `Postman Setup` instructions below to test out a login flow

### SQL File Dump

To replace the docker-compose Keycloak dump, configure Keycloak as desired and run the following command to execute a dump of the Postgres database.

`docker exec -it postgres sh -c "pg_dump -U keycloak keycloak > /mnt/dumps/keycloak-dump.sql"`

## Postman Client

### Postman Setup

There is a Postman collection for Keycloak captured in the `postman` directory. Postman can be downloaded [here.](https://www.getpostman.com/)

- Import the `*.postman_collection.json` collection using the `Import` button in the top left corner.
- Once imported, right click on the collection and choose `Edit`
- Navigate to the `Variables` tab
- Update the `client-secret` variable to match the secret generated in keycloak setup above (if it has changed)

### Auth Code Flow

For the auth code flow login, two requests need to be made: one to get the authorization code, one to exchange the authorization code for an access token and an identity token.

You can execute the `Auth Code Flow Code Request` request from Postman, however it redirects you to a login page so it is easier to do it simply by plugging in the right url into your browser.

To perform the request click [here](http://localhost:8085/auth/realms/demo/protocol/openid-connect/auth?response_type=code&client_id=test-client&redirect_uri=urn:ietf:wg:oauth:2.0:oob)

After logging in, Keycloak will redirect you to a page that displays the authorization code. Copy this code and plug it into the `Auth Code Flow Token Request` in Postman. Send the request and you will receive the expected tokens.