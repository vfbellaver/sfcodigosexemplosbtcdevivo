public with sharing class CriaContasOpportunidades {
    public CriaContasOpportunidades() {

    }

    public void processaDados(List<DataFakerIntegration.DadosRetornadosResponse> dados) {
       
        Map<String,Account> mapaContas = new Map<String,Account>();
        Map<String,Opportunity> mapaOpps = new Map<String,Opportunity>();

        for(DataFakerIntegration.DadosRetornadosResponse dado : dados) {
            Account novaConta = new Account();
            novaConta.Name = dado.Name;
            novaConta.Phone = dado.Phone;
            novaConta.Website = dado.website;
            mapaContas.put(dado.id,novaConta);

            Opportunity opp = new Opportunity();
            opp.Name = dado.name;
            opp.Amount = Decimal.valueOf(dado.amount);
            opp.StageName = 'Prospect';
            opp.CloseDate = dado.closeAt.date();
            mapaOpps.put(dado.id,opp);
        }

        insert mapaContas.values();
        System.debug(mapaContas.values());

        for(String chave : mapaContas.keySet())  {
            mapaOpps.get(chave).AccountId = mapaContas.get(chave).Id;
        }

        insert mapaOpps.values();
    }
}
