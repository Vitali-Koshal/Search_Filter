public with sharing class ContactController {
    public ContactController() {
       
        }
    //variable value for searching
    private String fieldBegin='';
    //variable to choose search field
    private String fieldName='FirstName';
    

    public String getFieldBegin() {
        return this.fieldBegin;
    }
    public void setFieldBegin(String fieldBegin) {
        this.fieldBegin=fieldBegin;
    }

    public String getFieldName() {
        return this.fieldName;
    }
    public void setFieldName (String fieldName) {
        this.fieldName=fieldName;
    }

    public List<Contact> getContacts() {
        List<Contact> results;

        if (fieldName=='LastName') {
            results=[SELECT FirstName, LastName, Email, Account.Name, MobilePnone
                    FROM Contact 
                    WHERE LastName
                    LIKE :fieldBegin + '%'
                    ORDER BY LastName];
        }
        else if (fieldName=='Email') {
            SELECT
        }
        else if (fieldName=='Account') {
            SELECT
        }
        else {
            SELECT
        }
        return results;
    }
    
}
