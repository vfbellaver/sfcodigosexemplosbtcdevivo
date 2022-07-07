public with sharing class DebugBatchClass implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        System.debug('start batch');
        return Database.getQueryLocator('SELECT Id, Name, Description FROM Opportunity');
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> oportunidades) {
        System.debug('execute batch');

        for(Opportunity opp : oportunidades) {
            opp.Description = 'BATCH CLASS';
        }
        update oportunidades;
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Processei as oportunidades');
    }
}