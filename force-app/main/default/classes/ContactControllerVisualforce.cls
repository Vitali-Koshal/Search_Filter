public with sharing class ContactControllerVisualforce {

    public String fieldBegin {get;set;}
    
    public List<Contact> getContacts(){
        if (String.isBlank(fieldBegin)) {
            fieldBegin = '';
        }
        String searchPatern = '%' + fieldBegin + '%';
        List<Contact> contacts = [
            SELECT Id, FirstName, LastName, Email, Account.Name, MobilePhone, CreatedDate, AccountId
            FROM Contact 
            WHERE FirstName 
            LIKE :searchPatern
            ORDER BY FirstName
            LIMIT 20
        ];
        if (contacts.isEmpty() && String.isEmpty(fieldBegin)) {
            throw newMessageExeption('Contacts list is empty');
        }
        return contacts;
    }

    private static AuraHandledException newMessageExeption(String message) {
        AuraHandledException auraException = new AuraHandledException(message);
        auraException.setMessage(message);
        return auraException;
    }
}
