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
            contactController.setFieldName('LastName');
            contactController.setFieldBegin('a');
            List<Contact> actualResults=contactController.getContacts();
            List<Contact> expectedResult=FilteredContactListTest.createFilteredContactList('LastName', 'a');
            System.assert(actualResults.size()==expectedResult.size());
            
        }
}