@isTest
public with sharing class ContactControllerTest {
    public ContactControllerTest() {

    }
    ContactController contactController=new ContactController();

        @isTest static void getFieldSelectorLength() {
            
            Integer length=contactController.getFieldSelector().size();
            System.assertEquals(4, length);
        }
        //@isTest static 
}