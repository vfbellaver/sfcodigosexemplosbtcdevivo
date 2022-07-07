public with sharing class DebugQueueableClass implements Queueable {
    
    public void execute(QueueableContext context) {
        List<Contact> aniversariantes = [SELECT Id, Email from Contact 
                                            WHERE CreatedDate = TODAY 
                                            AND EmailAniversarioEnviado__c = FALSE 
                                            LIMIT 1];
       
    }
}



