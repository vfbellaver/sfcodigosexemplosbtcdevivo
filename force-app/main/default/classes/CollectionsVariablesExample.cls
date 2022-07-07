public class CollectionsVariablesExample {    

    // ALGUNS EXEMPLOS DE VARIAVEIS DE SET
    public Set<String> textos = new Set<String>();
    public Set<Integer> inteiros = new Set<Integer>();
    public Set<Id> ids = new Set<Id>(); // Id é tipo de dado nativo do Salesforce
    public Set<Decimal> decimais = new Set<Decimal>();
    public Set<Set<String>> setdeset = new Set<Set<String>>(); // sim eu posso ter um set de set

    // ALGUNS EXEMPLOS DE VARIAVEIS DE LISTA
    public List<String> listaString = new List<String>();
    public List<Integer> listaInteiros = new List<Integer>();
    public List<Decimal> listaDecimais = new List<Decimal>();
    public List<Account> listaContas = new List<Account>();
    public List<Lead> listaLeads = new List<Lead>();
    public List<List<Account>> listadelistaContas = new List<List<Account>>(); // SIM podemos ter lista de listas de tipos variados

    // ALGUNS EXEMPLOS DE VARIAVEIS DE MAPA
    public Map<String,String> mapString = new Map<String,String>();

    public Map<String,Integer> mapStringInteger = new Map<String,Integer>();

    public Map<String,Set<String>> mapStringSet = new Map<String,Set<String>>(); //sim podemos ter mapa com chave e o valor é um set ou lista ou até mesmo outro mapa
    
    public Map<String,Map<String,Account>> mapStringMapAccount = new Map<String,Map<String,Account>>();

    Map<String,Map<String,List<Quote>>> mapContasOppQuote =  new  Map<String,Map<String,List<Quote>>>();

    //System.debug é um método da classe System que imprime o log o valor
    //de determinado item que você passa como parametro.

    // Método com ações em cima de duas variáveis de coleção
    //do tipo Set
    public void operacoesEmSets() {

        // As duas variaveis foram instanciadas com valores dentro
        Set<String> setString = new Set<String>{'Verde','Amarelo','Azul','Preto'};
        Set<Integer> setInteiros = new Set<Integer>{1,2,3,4,5,6,7};

        System.debug('op set integer');
        System.debug(setString.contains('Preto')); // imprimindo a verificação se dentro do set existe a cor preto
        System.debug(setString.size()); // imprimindo o tamanho do set
        setString.add('Marrom'); // adicionando a cor marrom ao set
        System.debug(setString.size()); // imprimindo o tamanho do set

        System.debug('---------------------------');

        System.debug('op set integer');
        System.debug(setInteiros.size()); // imprimindo o tamanho do set
        setInteiros.remove(3); // removendo o item de valor 3 do set
        setInteiros.remove(4); // removendo o item de valor 4 do set
        System.debug(setInteiros.size()); // imprimindo o tamanho do set
        Set<Integer> set2 = new Set<Integer>{6,7}; // instanciando um novo set de inteiros com valores 6,7 
        setInteiros.removeAll(set2); // removendo do setInteiros todos os valores que equivalem aos valores guardados no set2

        System.debug('---------------------------');
    }

    public void operacoesList() {
        List<String> listaString = new List<String>{'Verde','Amarelo','Azul','Preto'}; // Instanciando uma lista com 4 cores existentes
        List<Integer> listaInteger = new List<Integer>(); // instanciando uma lista vazia

        System.debug('listaString');
        System.debug(listaString.size()); // imprimindo o tamanho da lista
        System.debug(listaString.get(2)); // imprimindo o valor guardo no indice (posição) 2 da lista
        listaString.add('Marrom'); // adicionando a cor marrom a lista

        List<String> listaString2 = new List<String>{'Verde','Amarelo','Azul','Preto','Marrom'}; // Instanciando uma nova lista com valores dentro
        System.debug(listaString.equals(listaString2)); // imprimindo uma verificação se a listaString é igual a listaString2

        listaInteger.add(1); // adicionando o 1 a lista de inteiros
        listaInteger.add(2); // adicionando o 1 a lista de inteiros
        listaInteger.add(3); // adicionando o 1 a lista de inteiros
        System.debug(listaInteger.contains(4)); // imprimindo valor se na lista contem o valor 4

    }

    public void operacoesMap() {
        //instancei o map definindo as chaves e os valores para essas chaves (chave => valor)
        Map<String,String> mapStringString = new Map<String,String> {
            'Vagner' => 'Coxim',
            'Julio' => 'SP',
            'Maynan' => 'SP',
            'Carlos' => 'Fortaleza'
        };

        System.debug(mapStringString.get('Julio')); // imprimi o valor que estava guardado na chave Julio
        mapStringString.put('Julio', 'Rio de Janeiro'); // atualizei o valor que estava guardado na chave Julio para Rio de Janeiro
        System.debug(mapStringString.get('Julio')); // imprimi o valor que estava guardado na chave Julio

        mapStringString.put('Estheven', 'Curitiba'); // Criei uma nova chave no mapa chamada Estheven pois Estheven ainda não existe no mapa, e atribui o valor Curitiba pra ela
        mapStringString.remove('Carlos'); // removi o do mapa a chave e o valor da chave Carlos
 
        System.debug('Map vazio ?' + mapStringString.isEmpty()); // Imprimi a verificação se o mapa está vazio

        //instanciei um mapa de chave String e valor list de strings com chaves e suas listas (string => List<String>)
        Map<String,List<String>> mapStringListString = new Map<String,List<String>>{
            'VW' => new List<String>{'Fusca','Polo','Saveiro'},
            'Toyota' => new List<String>{'Etios', 'Yaris'}
        };

        List<String> listaCarrosToyota = mapStringListString.get('Toyota'); //Peguei a lista que estava guardada na chave Toyota e guardei em uma variavel de lista String
        listaCarrosToyota.add('Hilux'); //add Hilux a essa lista
        mapStringListString.put('Toyota', listaCarrosToyota); //Atualizei a lista que estava guardada na chave Toyota

        // FAZENDO AS 3 LINHAS ACIMA EM UMA LINHA SÓ
        mapStringListString.get('Toyota').add('Hilux');

        
        mapStringListString.keySet(); //retorna um set do tipo de dados da chave;
        mapStringListString.values(); //retorna uma lista de dados do tipo dos dados do valor da chave 
    }

    // PARA CHAMAR CADA MÉTODO DESSE BASTA CRIAR UMA INSTANCIA DA CLASSE OU SEJA UM OBJETO E CHAMAR O 
    //MÉTODO (COMPORTAMENTO)
    // EX:
    // CollectionsVariablesExample colecoes = new CollectionsVariablesExample();
    // colecoes.operacoesEmSets();
    // colecoes.operacoesList();
    // colecoes.operacoesMap();
}
