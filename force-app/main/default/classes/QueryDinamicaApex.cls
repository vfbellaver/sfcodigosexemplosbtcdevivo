public with sharing class QueryDinamicaApex {
    
    public void executaQueryDinamica(List<String> camposObjeto, String objetoDestino, String clausulaWhere) {
        String query = 'SELECT Id';

        for(String campo : camposObjeto) {
            query += ', ' + campo;
        }

        query += 'FROM ' + objetoDestino;
        query += clausulaWhere;

        Database.query(query);
    }
}
