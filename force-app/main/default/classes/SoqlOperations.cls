public with sharing class SoqlOperations {
    
    public List<Lead> buscaLeads() {
        return [SELECT Id, Name FROM Lead];
    }

    public Account buscaContasOpp(String idConta) {
       return  [SELECT Id, Name,
                        (SELECT Id, Name, Amount FROM Opportunities WHERE StageName = 'Closed Won')
                    FROM Account 
                    WHERE Id =: idConta];
        
    } 

    public List<Opportunity> buscaOppGanhaComConta(){
        return [SELECT Id, 
                        Name, Amount, Account.Name 
                FROM Opportunity 
                WHERE StageName = 'Closed Won'];
    }
}
