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
            for(Integer i=0;i<actualResults.size();i++){
                if(actualResults.get(i).FirstName!=expectedResult.get(i).FirstName) {
                    System.assert(false, 'Search list does not match');
                }
                else {
                    System.assert(true, 'Search list OK');
                }
            }
        }
}