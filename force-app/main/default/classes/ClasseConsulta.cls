public with sharing class ClasseConsulta {
    

    public void funcaoAgregada() {

        List<AggregateResult> listaAgregada = [SELECT SUM(Amount) resultado FROM Opportunity];

        for(AggregateResult agr : listaAgregada) {
            System.debug('resultado '+ agr.get('resultado'));
        }

        for (Integer i = 0; i < 200; i++) {
            List<Account> contas = [SELECT id FROM Account];
        }
    }
}
