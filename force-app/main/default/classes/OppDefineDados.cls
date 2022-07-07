public with sharing class OppDefineDados {
    public OppDefineDados() {}

    public void defineDados(Decimal valor, String texto, List<Opportunity> opps) {
        for(Opportunity opp : opps) {
            opp.Amount = valor;
            opp.Description = texto;
            opp.AccountId = '';
        }
    }
}
