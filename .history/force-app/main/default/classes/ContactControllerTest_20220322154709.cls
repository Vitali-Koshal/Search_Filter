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
            
        }
}