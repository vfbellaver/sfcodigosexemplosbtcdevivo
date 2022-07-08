@IsTest
global class DataFakerIntegrationMockClass implements HttpCalloutMock{
    
    Integer statusCode;
    String bodyResposta;
    
    public DataFakerIntegrationMockClass(Integer statusCodeEx, String body) {
        this.statusCode = statusCodeEx;
        this.bodyResposta = body;
    }

    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse resposta = new HttpResponse();
        resposta.setStatusCode(this.statusCode);
        resposta.setBody(this.bodyResposta);
        resposta.setHeader('Content-Type', 'application/json');
        return resposta;
    }
}
