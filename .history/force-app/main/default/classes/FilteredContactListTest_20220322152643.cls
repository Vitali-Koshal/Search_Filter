@isTest
public with sharing class FilteredContactListTest {
    public FilteredContactListTest() {
    }
    public static List<Contact> createFilteredContactList(String filterValue, String fieldValue){
        List<Contact> cont=new List<Contact>();
        if (fieldValue=='LastName') {
                cont=[SELECT FirstName, LastName, Email, Account.Name
                        FROM Contact 
                        WHERE LastName
                        LIKE :filterValue + '%'
                        ORDER BY LastName];
        }
        else if (fieldValue=='Email') {
            cont=[SELECT FirstName, LastName, Email, Account.Name
                    FROM Contact 
                    WHERE Email
                    LIKE :filterValue + '%'
                    ORDER BY Email];
        }
        else if (fieldValue=='Account.Name') {
            cont=[SELECT FirstName, LastName, Email, Account.Name
                    FROM Contact 
                    WHERE Account.Name
                    LIKE :filterValue + '%'
                    ORDER BY Account.Name];
        }
        else {
            cont=[SELECT FirstName, LastName, Email, Account.Name
                    FROM Contact 
                    WHERE FirstName
                    LIKE :filterValue + '%'
                    ORDER BY FirstName]; 
        }
    }
}
