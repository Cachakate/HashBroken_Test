# hashBrokenTest

The testing project was created using a Framework called "KARATE". 

There are six test scenarios, at least one test for each of the paths availaible. 

Here is a description of each test:

1. Scenario: Get a value for job identifier. This test is just validing that an ID is asignated to the request.
2. Scenario: Get hash for a non existing job. This test is validading that when sending a job that is not exiting a proper error is displayed.
3. Scenario: Get hash for a negative none existing job This test is validading that when sending a job that has a negative values is the app is responfing a proper error
4. Scenario: Get a Job and Get hash for an existing job: This test is calling the path to create a hash and the path to validated the value. Integration test. 
5. Scenario: Get the valid stats for the requests made. This test iscalling the path to get stats and validatind that the expected value of request is there. 
6. Scenario: the application shut downs. Validating that when the app is turn off we get a 200 response code.  
