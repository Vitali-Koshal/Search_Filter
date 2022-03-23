@isTest
public with sharing class FilteredContactListTest {
    public FilteredContactListTest() {
    }
    public static List<Contact> createFilteredContactList(String filterValue, String fieldValue){
        List<Contact> cont=new List<Contact>();
        if (fieldValue=='FirstName') {
            cont=[SELECT FirstName, LastName, Email, Account.Name
            FROM Contact 
            WHERE LastName
            LIKE :filterValue + '%'
            ORDER BY LastName];
        }
    }
}
