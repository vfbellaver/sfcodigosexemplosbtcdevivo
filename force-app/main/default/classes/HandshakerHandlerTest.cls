@IsTest
private class HandshakerHandlerTest {


    @IsTest
    static void theSumIsSuccessTest() {
        Integer resultadoEsperado = 4;
        Integer resultado;
        Test.startTest();
         resultado = HandshakerHandler.theSumIs(3, 1);
        Test.stopTest();

        System.assert(resultado != null);
        System.assertEquals(resultadoEsperado, resultado);
    }

    @IsTest
    static void theSumIsNegativeNumberTest(){
        Integer resultadoEsperado = 2;
        Integer resultado;
        Test.startTest();
         resultado = HandshakerHandler.theSumIs(3, -1);
        Test.stopTest();

        System.assert(resultado != null);
        System.assertEquals(resultadoEsperado, resultado);   
    }
    

    @IsTest
    static void buscaSObjectsEmptyListTest(){
        String campos = 'FirstName,LastName';
        String objeto = 'Contact'; 
        List<SObject> listaRetorno;

        Test.startTest();
            listaRetorno = HandshakerHandler.buscaSobjects(campos, objeto);
        Test.stopTest();

        System.assertNotEquals(null, listaRetorno);
        System.assertEquals(true, listaRetorno.isEmpty());
        
    }

    @IsTest
    static void buscaSObjectsNotEmptyListTest(){
        Contact contato = new Contact();
        contato.FirstName = 'Test';
        contato.LastName = 'Test 2';
        insert contato;

        String campos = 'FirstName,LastName';
        String objeto = 'Contact'; 
        List<SObject> listaRetorno;

        Test.startTest();
            listaRetorno = HandshakerHandler.buscaSobjects(campos, objeto);
        Test.stopTest();

        System.assertNotEquals(null, listaRetorno);
        System.assertEquals(false, listaRetorno.isEmpty());
        System.assertEquals(1, listaRetorno.size());
        System.assertEquals(contato.FirstName, listaRetorno.get(0).get('FirstName'));

        System.assertEquals(Contact.getSObjectType(), listaRetorno.getSObjectType());
        
    }

    
    @IsTest
    static void buscaSObjectsExceptionTest(){
        Contact contato = new Contact();
        contato.FirstName = 'Test';
        contato.LastName = 'Test 2';
        insert contato;

        String campos = 'FirstName,LastName';
        String objeto = ''; 
        List<SObject> listaRetorno;

        Boolean deuErro = false;
        String tipoExcecao;
        Test.startTest();
        try {
            listaRetorno = HandshakerHandler.buscaSobjects(campos, objeto);
        } catch (Exception ex) {
            deuErro = true;
            tipoExcecao = ex.getTypeName();
        }
        Test.stopTest();

        System.assertEquals(null, listaRetorno);
        System.assertEquals(true, deuErro);
        System.assertEquals(true, tipoExcecao.contains('AuraHandledException'));
    }
}