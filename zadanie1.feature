Feature: authenticate to the application
Background:
	Given I am regular user
	
Scenario Outline: successful authenticate to the application
	Given I am registered user 
	And I am on login page
	When I fill login field with <login> 
	And fill <password> 
	Then I successful authenticate to the application
	And I can see my account details – name, surname, email address, mailing adres
Examples:
| login								| password	|
| monikawiklinska@gmail.com					| 123456	|
| monikawiklinskamonikawiklinskamonikawiklinskamonik@gmail.com	| 123456	|
| monikawiklinskamonikawiklinskamonikawiklinskamoni@gmail.com	| 123456	|

Scenario: unregistered user unsuccessful authenticate to the application 
	Given I am not registered user
	And I am on login page
	When I fill login field with testowanie@gmail.com
	And fill password 987654	
	Then I can see error message "Authentication failed. Login or password are incorrect.”
	And I can not see my account details 

Scenario Outline: other cases of unsuccessful authenticate to the application
	Given I am on login page
	When I fill login field with <login> 
	And fill <password> 
	Then I can see error message "Authentication failed. Login or password are incorrect.”
	And I can not see my account details 
Examples:
| login													| password	|
| monika												| 123456	|
| monikawiklinska@gmail											| 123456	|
| monikawiklinska@com.											| 123456	|
| monikawiklinska@gmailcom										| 123456	|
| monikawiklinskamonikawiklinskamonikawiklinskamonika@gmail.com						| 123456	|
| monikawiklinskamonikawiklinskamonikawiklinskamonikamonikawiklinskamonikawiklinskamonikawiklinskamonika@gmail.com	| 123456	|		
|													| 123456	|
| monikawiklinska@gmail.com										|		|	
