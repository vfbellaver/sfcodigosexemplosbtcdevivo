public class ControllerAuraCmp {
    
    @AuraEnabled
    public static List<Contact> retornaContatosConta(String idConta){
        try {
            return [SELECT Id, Name FROM Contact WHERE AccountId =: idConta];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Contact createContact(Contact contact){
        upsert contact;
        return contact;
    }
}
