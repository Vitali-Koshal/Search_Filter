public with sharing class ContactControllerForceTest {
    @testSetup
    private static void makeData(){
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < 5; i++) {
            Account account = new Account(Name = 'Account ' + i);
            insert account;
            contacts.add(new Contact(
                FirstName = 'Name ' + i,
                LastName = 'LastName',
                Email = 'Email' + i + '@test.com'),
                AccountId = account.Id);
        }
        insert contacts;
    }

    @isTest 
    private static void fieldName__setAndGetFieldName_fieldNameWasSetAndGot() {

        Test.startTest();
        ContactControllerForce.fieldName = 'LastName';
        Test.stopTest();

        System.assertEquals('LastName', fieldName, 'get set method doesnt work');

    }
}
