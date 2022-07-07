public with sharing class SoSlOperations {
    
    public List<List<SObject>> buscaContatoConta(String valor) {
        return [FIND :valor IN ALL FIELDS
                    RETURNING Account(Name), Contact(FirstName, LastName)
                ];
    } 
    
}
