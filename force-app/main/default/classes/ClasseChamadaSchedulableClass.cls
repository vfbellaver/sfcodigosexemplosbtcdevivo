public with sharing class ClasseChamadaSchedulableClass {
    Integer valorOpp;

    public ClasseChamadaSchedulableClass() {
        this.valorOpp = Datetime.now().second() * 1000;
    }


    public List<Opportunity> buscaOportunidades() {
        List<Opportunity> listaOpp = [SELECT Id, 
                                                Name, Account.Name, Amount 
                                            FROM Opportunity 
                                            WHERE StageName = 'Closed Won' 
                                            AND Amount > :this.valorOpp];
        
        return !listaOpp.isEmpty() ? listaOpp : new List<Opportunity>();
    }

    public void imprimeDadosOpp( List<Opportunity> listaOpps) {
        for(Opportunity opp : listaOpps) {
            System.debug('Nome opp - ' + opp.Name);
            System.debug('Nome da conta - '+ opp.Account.Name);
            System.debug('Valor opp - ' + opp.Amount);
        }
    }
}
