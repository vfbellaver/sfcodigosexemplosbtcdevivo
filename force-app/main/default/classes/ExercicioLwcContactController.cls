public with sharing class ExercicioLwcContactController {
   
    @AuraEnabled
    public static Account getAccountWithContactsById(String accountId){
        try {
            return [SELECT Id, Name, (SELECT Id, FirstName, LastName, Phone FROM Contacts)  FROM Account WHERE Id =: accountId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
