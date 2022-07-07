public with sharing class HandshakerHandler {

    // @AuraEnabled(cacheable=true)
    // public static Integer theSumIs(Integer a, Integer b, Integer c){
    //     if(a==0 && b==0)
    //         throw new AuraHandledException('Both A and B are 0!!!');
    //     return a*b;    
    // }


    @AuraEnabled(cacheable=true)
    public static Integer theSumIs(Integer a, Integer b){
        if(a==0 && b==0)
            throw new AuraHandledException('Both A and B are 0!!!');
        return a + b;    
    }

    @AuraEnabled
    public static List<SObject> buscaSobjects(String campos, String objeto){
        try {
            String query = 'SELECT ' + campos + ' FROM ' + objeto;
            return  Database.query(query); 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
