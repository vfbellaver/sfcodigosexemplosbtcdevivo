public with sharing class EstruturasCondicionaisExample {
    
    public void ifExample() {

        Account acc = new Account(Name = 'Conta 1');
        if(acc.Name == 'Conta 1') {
            //executo bloco de código
        }
    }


    public void ifElseExample() {

        Account acc = new Account(Name = 'Conta 1');
        if(acc.Name == 'Conta 2') {
            //executo bloco de código
        } else {
            // executo esse código
        }
    }


    public void ifElseEncadeadoExample() {

        Account acc = new Account(Name = 'Conta 1');
        if(acc.Name == 'Conta 2') {
            //executo bloco de código
        
        } else if(acc.Name == 'Conta 1'){ // nova verificação
            // executo esse código
        } 

    }


    public void ifImplicitoExample() {
        Account acc = new Account(Name = 'Conta 1');

        if(acc.Name == 'Conta 2')
            System.debug('Verdade');
        else
            System.debug('Não é verdade');
    }


    public void ternarioExample() {
        Lead novoLead = new Lead(LeadSource = 'Site');
        Account novaConta = new Account();

        novaConta.AccountSource = novoLead.LeadSource == 'Site' ? 'Site' : 'Outros';
    }


    public void switchExample() {
        
        Integer i = 5;

        switch on i {
            when 2, 3, 4 {
                System.debug('when block 2 and 3 and 4');
            }
            when 5, 6 {
                System.debug('when block 5 and 6');
            }
            when 7 {
                System.debug('when block 7');
            }
            when else {
                System.debug('default');
            }
         }
    }


   
}
