public with sharing class ContactControllerForce {
    
    public String fieldBegin {
        get {
            if (String.isBlank(fieldBegin)) {
                return '';
            } else {
                return fieldBegin;
            }
        } 
        set;
    }

    public String fieldName {
        get {
            if (String.isBlank(fieldName)) {
                return 'FirstName';
            } else {
                return fieldName;
            }
        } 
        set;
    }
        
    //Creating field Selector option 
    public List<SelectOption> getFieldSelector() {
        List<SelectOption> fieldSelector = new List<SelectOption>();
        fieldSelector.add(new SelectOption('FirstName', 'First Name'));
        fieldSelector.add(new SelectOption('LastName', 'Last Name'));
        fieldSelector.add(new SelectOption('Email', 'Email'));
        fieldSelector.add(new SelectOption('Account', 'Account'));
        return fieldSelector;
    }

    public List<Contact> getContacts() {
        List<Contact> results;
        if (fieldName == 'LastName') { //search by LastName
            results = [
                SELECT FirstName, LastName, Email, Account.Name, MobilePhone, CreatedDate
                FROM Contact 
                WHERE LastName
                LIKE :fieldBegin + '%'
                ORDER BY LastName
            ];
        } else if (fieldName == 'Email') { //Search by Email
            results = [
                SELECT FirstName, LastName, Email, Account.Name, MobilePhone, CreatedDate
                FROM Contact 
                WHERE Email
                LIKE :fieldBegin + '%'
                ORDER BY Email
                ];
        } else if (fieldName == 'Account') { //Search by Account
            results = [
                SELECT FirstName, LastName, Email, Account.Name, MobilePhone, CreatedDate
                FROM Contact 
                WHERE Account.Name
                LIKE :fieldBegin + '%'
                ORDER BY Account.Name];
        } else { //Search by FirstName
            results = [
                SELECT FirstName, LastName, Email, Account.Name, MobilePhone, CreatedDate
                FROM Contact 
                WHERE FirstName
                LIKE :fieldBegin + '%'
                ORDER BY FirstName
            ];
        }
        return results;
    }   
}


/*
<apex:page controller="ContactControllerForce">
    <apex:form >
        <apex:pageBlock title="Contact List">
            <apex:pageBlockSection title="SEARCH BY NAME"> 
                <apex:commandButton value="FILTER" reRender="contact_list">
                    <div style="margin-bottom:5px; font-weight:bold">SEARCH FIELD</div>
                    <apex:selectList value="{! fieldName}" size="1">
                        <apex:selectOptions value="{! fieldSelector}"/>
                        <apex:actionSupport event="onchange" reRender="contact_list"/>
                    </apex:selectList>
                    &nbsp;<apex:inputText value="{! fieldBegin}"/>&nbsp;
            	</apex:commandButton>
            </apex:pageBlockSection>

            <!--The main data table-->
            <apex:pageBlockTable id="contact_list" var="cont" value="{!contacts}">
                <apex:column value="{!cont.FirstName}" headerValue="First Name"/>
                <apex:column value="{!cont.LastName}" headerValue="LAST NAME"/>
                <apex:column value="{!cont.Email}" headerValue="Email Address"/>
                <apex:column headerValue="Account Name">
                    <apex:outputLink value="/apex/AccountDetail?core.apexpages.request.devconsole=1
                    &id={!cont.Account.Id}">
                        {!cont.Account.Name}
                    </apex:outputLink>
                </apex:column>
                <apex:column value="{!cont.MobilePhone}" headerValue="MOBILE"/>
                <apex:column value="{!cont.CreatedDate}" headerValue="DATE"/>
            </apex:pageBlockTable>
        </apex:pageBlock>
    </apex:form>
    
</apex:page>
 */