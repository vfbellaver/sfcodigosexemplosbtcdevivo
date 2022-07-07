public with sharing class ExtendsController {
    
    public ExtendsController(ApexPages.StandardController sc){}

    public String variavel = 'Bem vindo!';

    public String getSaudacao() {
        return 'Oi, eu sou GOKU!';
    }

    public Integer getDiaHoje() {
        return Date.today().day();
    }
}
