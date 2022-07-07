public class OportunidadesController {
    
    @AuraEnabled
    public static List<Opportunity> buscaOppsById(String accountId){
        try {
            return [SELECT Id, Name, Amount, StageName FROM Opportunity WHERE AccountId =: accountId ORDER BY Amount DESC];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
