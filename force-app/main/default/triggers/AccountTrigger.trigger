trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete) {
    
    if(Trigger.isBefore) {
        
        if(Trigger.isInsert) {
            
            List<Account> novosDadosConta = Trigger.new;
            
            for(Account conta : novosDadosConta) {
                System.debug('isBefore/isInsert - List Novo nome conta '+conta.Name);
            }

        } else if(Trigger.isUpdate) {
            List<Account> antigosDadosConta = Trigger.old;
            for(Account conta : antigosDadosConta) {
                System.debug('isBefore/isUpdate - List Antigo nome conta '+conta.Name);
            }

            Map<Id,Account> mapaAntigosDadosConta = Trigger.oldMap;
            for(Id idConta : mapaAntigosDadosConta.keySet()) {
                System.debug('isBefore/isUpdate - Map Antigo nome conta '+mapaAntigosDadosConta.get(idConta).Name);
            }

        } else if(Trigger.isDelete) {
            // code instructions before delete
        }
    }

    if(Trigger.isAfter) {
         
        if(Trigger.isInsert) {
            // code instructions before insert

        } else if(Trigger.isUpdate) {
            List<Account> novosDadosConta = Trigger.new;
            for(Account conta : novosDadosConta) {
                System.debug('isAfter/isUpdate - List Novo nome conta '+conta.Name);
            }

            Map<Id,Account> mapaNovosDadosConta = Trigger.newMap;

            for(Id idConta : mapaNovosDadosConta.keySet()) {
                System.debug('isAfter/isUpdate - Map Novo nome conta '+mapaNovosDadosConta.get(idConta).Name);
            }

        } 
    }
}