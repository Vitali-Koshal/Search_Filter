@isTest
public class ContactControllerTest{
    ContactController contactController=new ContactController();
    @isTest static void getFieldSelectorLength() {
        Integer length=contactController.getFieldSelector.length();
        System.assertEquals(4, length);
    }
}