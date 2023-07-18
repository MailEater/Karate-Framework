Feature: TEK Insurance API Test

  Background: Setup Request URL
    Given url "https://tek-insurance-api.azurewebsites.net"

  #endpoint = /api/token
  #if you send wrong username you should get 400 Status code
  #and API Response message "User not found"
  @Test
  Scenario: Negative Test verify user enters wrong username with correct password
  And path "api/token"
  And request {"username": "wrongUsername", "password": "tek_supervisor"
  When method post
  Then status 200
  And print response

  #endpoint = /api/token
  #if you send correct username and wrong password
  #you should see 400 Bad Request and errorMessage Password not match
  Scenario: Negative Test verify user enters correct username with wrong password

  #Endpoint = /api/token
  #with valid username and password get a token.
  Scenario: Positive Test validate correct username with password get a token

  #endpoint = /api/token/verify
  #With a valid token you should get response HTTP Status Code 200 and response true
  Scenario: Positive Test validate with valid token with Status Code response true

  #Endpoint = /api/token/verify
  #With valid token and invalid username you should get response HTTP Status Code 400
  #and error message "Wrong Username send along with Token"
  Scenario: Negative Test valdiate with valid token and invalid username

  #Endpoint = /api/token/verify
  #with invalid token and valid username should have Status code 400
  #and error Message "Token Expired or Invalid Token"
  Scenario: Negative Test validate with invalid token and valid valid username

  #Endpoint = /api/accounts/get-all-accounts
  #Make sure API Status code is 200
  #and Returns all the account (it might take 10 Second to get response).
  Scenario: Validate status code is OK and return all acounts

  #Endpoint = /api/accounts/get-account
  #For primaryPersonId = 6639
  #Make sure email address is "ChristinNikolaus@tekschool.us"
  Scenario: Verify primaryPersonID and email match

  #Endpoint = /api/accounts/add-primary-account.
  #This Endpoint is to create new account
  #and data will store in primary_person table. Status Code = 201
  #Notes:
  #duplicate email not accepted
  #For Gender and maritalStatus You have to use the Predefined values.
  #Once you create Account validate database and take screenshot.
  #FirstName and LastName should be your name.
  #In Request body we don't need id and isNew field (you can remove them).
  Scenario: Create new account

  #Endpoint = /api/accounts/add-primary-account.
  #Validate Duplicate Email is Not Acceptable.
  #Status Code 400
  #And Error Message Email is Exist.
  Scenario: Validate that duplicate email is not acceptable

  #End Point = /api/accounts/add-account-phone
  #For the Account you created in Scenario 10 add phone number.
  #Validate in Database
  #Status Code is 201
  #Response with your Phone Created.
  #*Requirement: 1 Account Can not have duplicate phone number.
  Scenario: Verify you can add phone number

  #End Point = /api/accounts/update-account-phone
  #Update the Phone number you created Scenario 12
  #Status Code 200
  #Validate in Database
  Scenario: Verify phone number can be updated

  #Endpoint: /api/accounts/add-account-car
  #Add a car to the account create on scenario 10.
  #Response Status = 201
  #Validate with database.
  Scenario: Validate that you can add car to account

  #End point: /api/accounts/delete-account
  #With this endpoint delete the account created in scenario 10.
  #Response Status = 200
  #Message = "Account Successfully deleted"
  Scenario: Verify account can be deleted

  #Using Scenario 10 Create new Account.
  #Then Add Address => Endpoint: /api/accounts/add-account-address
  #Add car => Endpoint: /api/accounts/add-account-car
  #Add phone => Endpoint: /api/accounts/add-account-phone
  #Validate in DB. (can you write a query which return the data from tables in  one query).
  Scenario: Verify new account can add multiple options
