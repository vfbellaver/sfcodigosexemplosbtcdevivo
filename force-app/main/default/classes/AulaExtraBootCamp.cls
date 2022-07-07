public class AulaExtraBootCamp {

    public void metodo() {
       List<Account> listaContas = [SELECT Id,Name, (Select Id, Name From Opportunities) FROM Account]; 
       
       Map<String,List<Quote>> mapOppQuote = new Map<String,List<Quote>>(); 
       
       for(Account conta : listaContas) {

           for(Opportunity opp : conta.Opportunities) {
                mapOppQuote.put(opp.Id,new List<Quote>());
           }

       }
        
       List<Quote> cotacoes = [SELECT Id, Name, OpportunityId FROM Quote WHERE OpportunityId IN :mapOppQuote.keySet()];

       for(Quote qc : cotacoes) {
            
            List<Quote> listaCotacao = mapOppQuote.get(qc.OpportunityId);
            listaCotacao.add(qc);
            mapOppQuote.put(qc.OpportunityId,listaCotacao);

            //---------------------------------------
            // mapOppQuote.get(qc.OpportunityId).add(qc);
       }


       Map<String,Map<String,List<Quote>>> mapContasOppQuote =  new  Map<String,Map<String,List<Quote>>>();

        for(Account conta : listaContas) {
            
            Map<String,List<Quote>> mapaExtra = new Map<String,List<Quote>>();
        
            for(Opportunity opp : conta.Opportunities) {
                mapaExtra.put(opp.Name, mapOppQuote.get(opp.Id));
            }

            mapContasOppQuote.put(conta.Name, mapaExtra);
        }
 
       
       for(String nomeConta : mapContasOppQuote.keySet()) {

            System.debug('Conta: ' + nomeConta);

            for(String nomeOportunidade : mapContasOppQuote.get(nomeConta).keySet()) {

                System.debug('Oportunidade: ' + nomeOportunidade);

                for(Quote cotacao : mapContasOppQuote.get(nomeConta).get(nomeOportunidade)) {
                    System.debug('Cotação: ' + nomeOportunidade);
                }

            }
       }
    }
}