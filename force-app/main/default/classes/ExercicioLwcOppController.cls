public with sharing class ExercicioLwcOppController {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppsByName(String parametroLike) {
        try {
            return [SELECT Id, Name, Amount, StageName FROM Opportunity WHERE Name LIKE :parametroLike +'%'];
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}
