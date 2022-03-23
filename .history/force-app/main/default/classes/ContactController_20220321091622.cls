public with sharing class ContactController {
    public ContactController() {
       
        }
    //variable value for searching
    private String fieldBegin='';
    //variable to choose search field
    private String fieldName='FirstName';
    //
          

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
    //Creating field Selector option 
    public List<SelectOption> getFieldSelector() {
        List<SelectOption> fieldSelector=new List<SelectOption>();
        fieldSelector.add(new SelectOption('FirstName', 'First Name'));
        fieldSelector.add(new SelectOption('LastName', 'Last Name'));
        fieldSelector.add(new SelectOption('Email', 'Email'));
        fieldSelector.add(new SelectOption('Account', 'Account'));
        return fieldSelector;
    }
    public List<Contact> getContacts() {
        List<Contact> results;

        if (fieldName=='LastName') {
            results=[SELECT FirstName, LastName, Email, Account.Name, MobilePhone
                    FROM Contact 
                    WHERE LastName
                    LIKE :fieldBegin + '%'
                    ORDER BY LastName];
        }
        else if (fieldName=='Email') {
            results=[SELECT FirstName, LastName, Email, Account.Name, MobilePhone
                    FROM Contact 
                    WHERE Email
                    LIKE :fieldBegin + '%'
                    ORDER BY Email];
        }
        else if (fieldName=='Account') {
            results=[SELECT FirstName, LastName, Email, Account.Name, MobilePhone
                    FROM Contact 
                    WHERE Account.Name
                    LIKE :fieldBegin + '%'
                    ORDER BY Account.Name];
        }
        else {
            results=[SELECT FirstName, LastName, Email, Account.Name, MobilePhone
                    FROM Contact 
                    WHERE FirstName
                    LIKE :fieldBegin + '%'
                    ORDER BY FirstName];
        }
        return results;
    }
    
}
