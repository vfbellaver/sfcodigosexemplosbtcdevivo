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
    

}
