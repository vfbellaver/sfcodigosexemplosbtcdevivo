public with sharing class EstruturasRepeticao {
    
    //--------------------------------------------
    // While example
    public void whileExampleMethod() {
        Integer numero = 0;
        while (numero < 100) {
            System.debug('nr anterior '+ numero);
            numero++;
            System.debug('nr incrementado '+ numero);
        }
    }

    // --------------------------------------------
    // Do While Example
    public void doWhileExampleMethod() {
        Integer numero = 0;
        do {
            System.debug('nr anterior '+ numero);
            numero++;
            System.debug('nr incrementado '+ numero);
        } while (numero < 100);
    }

    // ---------------------------------------------------
    // for looping 
    public void forLoopingMethod() {
        Integer numero = 200;
        for (Integer i = 0; i <= numero; i++) {
            System.debug(i);
        }
    }

    // -----------------------------------------------------
    // for each
    public void forEachExampleMethod() {
        List<Account> listaContas = new List<Account>();
        
        Account c1 = new Account(Name = 'c1', AccountSource = 'Site', NumberOfEmployees=200);
        Account c2 = new Account(Name = 'c2');
        Account c3 = new Account(Name = 'c3');
        Account c4 = new Account(Name = 'c4');
        Account c5 = new Account(Name = 'c5');

        listaContas.add(c1);
        listaContas.add(c2);
        listaContas.add(c3);
        listaContas.add(c4);
        listaContas.add(c5);
        
        for (Account acc: listaContas){
            System.debug(acc.Name);
        }
    }

    // ------------------------------------------------------
    // for soql
    public void forSoqlExampleMethod() {
        for (Account acc : [SELECT Id, Name FROM Account WHERE Name LIKE 'U%' ORDER BY Name ASC]) {
            System.debug(acc.Name);
        }

    }

    
}
