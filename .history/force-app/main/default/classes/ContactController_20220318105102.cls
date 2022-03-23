public with sharing class ContactController {
    public ContactController() {
       
        }
    //variable value for searching
    private String fieldBegin='';

    

    public String getFieldBegin() {
        return fieldBegin;
    }
    public void setFieldBegin(String fieldBegin) {
        this.fieldBegin=fieldBegin;
    }

    public List<Contact> getContacts() {
        List<Contact> results;
    }
    
}
