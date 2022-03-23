@isTest
public with sharing class ContactControllerTest {
    public ContactControllerTest() {

    }
    

        @isTest static void getFieldSelectorLength() {
            ContactController contactController=new ContactController();          
            Integer length=contactController.getFieldSelector().size();
            System.assertEquals(4, length);
        }
        @isTest static void getFirstNameFilteredList() {
            ContactController contactController=new ContactController();
            contactController.setFieldName('FirstName');
            contactController.setFieldBegin('a');
            List<Contact> actualResults=contactController.getContacts();
            List<Contact> expectedResult=FilteredContactListTest.createFilteredContactList('FirstName', 'a');
            System.assert(actualResults.size()==expectedResult.size());
            boolean matchResult=true;
            for(Integer i=0;i<actualResults.size();i++){
                if(actualResults.get(i).FirstName!=expectedResult.get(i).FirstName) {
                    matchResult=false;
                }                
            }
            System.assert(matchResult, 'Search list does not match');
        }

        @isTest static void getLastNameFilteredList() {
            ContactController contactController=new ContactController();
            contactController.setFieldName('LastName');
            contactController.setFieldBegin('a');
            List<Contact> actualResults=contactController.getContacts();
            List<Contact> expectedResult=FilteredContactListTest.createFilteredContactList('LastName', 'a');
            System.assert(actualResults.size()==expectedResult.size());
            boolean matchResult=true;
            for(Integer i=0;i<actualResults.size();i++){
                if(actualResults.get(i).LastName!=expectedResult.get(i).LastName) {
                    matchResult=false;
                }                
            }
            System.assert(matchResult, 'Search list does not match');
        }

        @isTest static void getEmailFilteredList() {
            ContactController contactController=new ContactController();
            contactController.setFieldName('Email');
            contactController.setFieldBegin('a');
            List<Contact> actualResults=contactController.getContacts();
            List<Contact> expectedResult=FilteredContactListTest.createFilteredContactList('Email', 'a');
            System.assert(actualResults.size()==expectedResult.size());
            boolean matchResult=true;
            for(Integer i=0;i<actualResults.size();i++){
                if(actualResults.get(i).Email!=expectedResult.get(i).Email) {
                    matchResult=false;
                }
            }
            System.assert(matchResult, 'Search list does not match');
        }
        @isTest static void getAccountNameFilteredList() {
            ContactController contactController=new ContactController();
            contactController.setFieldName('Account');
            contactController.setFieldBegin('a');
            List<Contact> actualResults=contactController.getContacts();
            List<Contact> expectedResult=FilteredContactListTest.createFilteredContactList('Account', 'a');
            System.assert(actualResults.size()==expectedResult.size());
            boolean matchResult=true;
            for(Integer i=0;i<actualResults.size();i++){
                if(actualResults.get(i).Account.Name!=expectedResult.get(i).Account.Name) {
                    matchResult=false;
                }
            }
            System.assert(matchResult, 'Search list does not match');
        }
}