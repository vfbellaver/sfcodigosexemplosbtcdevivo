@IsTest
private class DataFakerIntegrationTest {
    

    @IsTest
    static void realizaChamadaDataFake200OK(){
        
        String resposta = '[{'+
                            +'"name": "Maverick Nienow",'
                            +'"email": "Chaz_Bashirian4@yahoo.com",'
                            +'"website": "https://julie.com",'
                            +'"amount": "932.29",'
                            +'"phone": "012-968-9714 x19529",'
                            +'"closeAt": "2023-05-21T09:10:57.394Z",'
                            +'"id": "7297606a-2a69-433b-a223-5b41462d8d08"'
                       +' },'
                        +'{'
                        +'    "name": "Alison Bailey",'
                        +'    "email": "Nedra_Koelpin@hotmail.com",'
                        +'    "website": "https://jordyn.org",'
                        +'    "amount": "226.08",'
                        +'    "phone": "716.200.4151",'
                        +'    "closeAt": "2023-06-24T22:57:36.673Z",'
                        +'    "id": "455b3ab6-1899-4e09-b2e0-9ed66d7ddbec"'
                        +'}]';

        Test.setMock(HttpCalloutMock.class, new DataFakerIntegrationMockClass(200,resposta));                        
        Test.startTest();
        DataFakerIntegration.realizaChamadaDataFake('hhtps://teste.teste.com');
        Test.stopTest();

        List<Account> listaContas = [SELECT Id, Name, (SELECT Id, Name FROM Opportunities) FROM Account];
        
        System.assertEquals(false, listaContas.isEmpty());
        System.assertEquals(2, listaContas.size());
        System.assertEquals(1, listaContas.get(0).Opportunities.size());
    }

    @IsTest
    static void realizaChamadaDataFake400OK(){

        Test.setMock(HttpCalloutMock.class, new DataFakerIntegrationMockClass(400,''));                        
        Test.startTest();
        DataFakerIntegration.realizaChamadaDataFake('hhtps://teste.teste.com');
        Test.stopTest();

        List<Account> listaContas = [SELECT Id, Name FROM Account];
        System.assertEquals(true, listaContas.isEmpty());

        List<Opportunity> opps = [SELECT Id, Name FROM Opportunity];
        System.assertEquals(true, opps.isEmpty());

    }
}
