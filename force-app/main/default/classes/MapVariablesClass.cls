public with sharing class MapVariablesClass {

    Map<String,Lead> mapaLeads = new Map<String,Lead>();

    public Map<String,Lead> addLeadMap(Lead lead) {
        
        mapaLeads.put(lead.NrDocumentoIdentificacao__c, lead);
        return mapaLeads;
    }

    public Set<String> entregaChavesMapa() {
        Set<String> chavesMapa = mapaLeads.keySet();
        return chavesMapa;
    }

    public Lead retornaDadosLead(String numeroDocumento) {
        Lead dadosLead = mapaLeads.get(numeroDocumento);
        return dadosLead;
    }
}
