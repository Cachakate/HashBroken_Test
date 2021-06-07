Feature: Password Hashing 

  Scenario: Get a value for job identifier
    Given url 'http://127.0.0.1:8088'
    And path 'hash'
    And header Accept = 'application/json'
    And request '{"password":"NOTangrymonkey"}'
    When method post
    Then assert response > 0
    Then print response
    
  Scenario: Get hash for a non existing job
    Given url 'http://127.0.0.1:8088'
    And path 'hash/3'
    And header Accept = 'application/json'
    When method get
    Then print response
    Then match response contains "Hash not found"
	
	Scenario: Get hash for a negative none existing job
    Given url 'http://127.0.0.1:8088'
    And path 'hash/-3'
    And header Accept = 'application/json'
    When method get
    Then print response
    Then match response contains "Hash not found"

	Scenario: Get a Job and Get hash for an existing job
    Given url 'http://127.0.0.1:8088'
    And path 'hash'
    And header Accept = 'application/json'
    And request '{"password":"angrymonkey"}'
    When method post
    Then assert response > 0
    Then print response
    Then def jobid = response
    
    Given url 'http://127.0.0.1:8088'
    And path 'hash/'+jobid
    And header Accept = 'application/json'
    When method get
    Then print response
    Then match response == '#notnull'
    Then assert response == "NN0PAKtieayiTY8/Qd53AeMzHkbvZDdwYYiDnwtDdv/FIWvcy1sKCb7qi7Nu8Q8Cd/MqjQeyCI0pWKDGp74A1g=="
    
  Scenario: Get the valid stats for the requests made	
    Given url 'http://127.0.0.1:8088'
    And path 'stats'
    And header Accept = 'application/json'
    When method get
    Then print response
    Then match response.TotalRequests == 2
    
   Scenario: the application shut downs	
    Given url 'http://127.0.0.1:8088'
    And path 'hash'
    And header Accept = 'application/json'
    And request 'shutdown'
    When method post
    Then status 200  
    