trigger OpportuntyTrigger on Opportunity (before insert, before update, after insert, after update) {

    if(Trigger.isBefore && Trigger.isInsert) {
        for(Opportunity opp : Trigger.new) {
            opp.Amount = 50000;
            opp.Description = 'To na Trigger is before  e  is insert';
        }
    }

    if(Trigger.isBefore && Trigger.isUpdate) {
        for(Opportunity opp : Trigger.new) {
            opp.Amount = 20000;
            opp.Description = 'To na Trigger is before  e  is update';
        }
    }

    if(Trigger.isAfter && Trigger.isInsert) {
        for(String Id : Trigger.newMap.keySet()) {
            System.debug('Contexto isafter insert | Chave - ' + Id + ' e o valor ammount = '+ Trigger.newMap.get(Id).Amount);
            System.debug('Contexto isafter insert | Chave - ' + Id + ' e o valor description = '+ Trigger.newMap.get(Id).Description);
        }
    }

    if(Trigger.isAfter && Trigger.isUpdate) {
        for(String Id : Trigger.newMap.keySet()) {
            System.debug('Contexto isafter update |  Chave - ' + Id + ' e o valor ammount = '+ Trigger.newMap.get(Id).Amount);
            System.debug('Contexto isafter update | Chave - ' + Id + ' e o valor description = '+ Trigger.newMap.get(Id).Description);
        }
    }
}