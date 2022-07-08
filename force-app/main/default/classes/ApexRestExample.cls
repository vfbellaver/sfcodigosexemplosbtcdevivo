@RestREsource(urlMapping='/Account/*')
global class ApexRestExample {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String IdConta = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1
        );
        
        Account conta = [SELECT Id, Name, Phone, NumberOfEmployees FROM Account WHERE Id =: IdConta];
        return conta;
    }

    @HttpPost
    global static String createAccount() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Account conta = (Account) JSON.deserialize(body, Account.class);
        insert conta;
        return conta.Id;
    }

}
