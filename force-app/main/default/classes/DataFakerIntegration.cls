public with sharing class DataFakerIntegration {
    
    public DataFakerIntegration() {
        DataFakerIntegration.realizaChamadaDataFake('https://data-faker.herokuapp.com/collection');
    }

    public static void realizaChamadaDataFake(String url) {
        HttpRequest req =  new HttpRequest();
        req.setHeader('Content-Type', 'application-json');
        req.setHeader('Accept-Charset', 'utf-8');
        req.setEndpoint(url);
        req.setMethod('POST');
        req.setTimeout(120000);

        CorpoRequisicaoRequestWrapper crrw = new CorpoRequisicaoRequestWrapper();
        
        req.setBody(JSON.serialize(crrw));

        Http envio = new Http();
        HttpResponse resposta = envio.send(req);

        if(resposta.getStatusCode() == 200) {
            List<DadosRetornadosResponse> dados = (List<DadosRetornadosResponse>) JSON.deserialize(resposta.getBody(), List<DadosRetornadosResponse>.class);
            CriaContasOpportunidades ccopp = new CriaContasOpportunidades();
            ccopp.processaDados(dados);

        } else if(resposta.getStatusCode() == 401) {

        } else {
            System.debug('Teste');
        }
    }

    public class CorpoRequisicaoRequestWrapper{
        Integer amountOfRecords = 5;
        DadosRequest recordMetadata = new DadosRequest();
    }

    public class DadosRequest {
        String name  = 'name';
        String email  = 'email';
        String website  = 'url';
        String amount  = 'currency';
        String phone  = 'phoneNumber';
        String closeAt  = 'dateInFuture';
    }

    public class DadosRetornadosResponse {
        public String name;
        public String email;
        public String website;
        public String amount;
        public String phone;
        public Datetime closeAt;
        public String id;
    }
}
