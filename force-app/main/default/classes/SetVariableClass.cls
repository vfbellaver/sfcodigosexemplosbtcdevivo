public with sharing class SetVariableClass {
    Set<String> cidades = new Set<String>();

    public void adicionaElementoSet(String valor) {
        cidades.add(valor);
    }

    public void removeElementoSet(String valor) {
        cidades.remove(valor);
        Boolean variavelBooleana = verificaSetVazio();
    }

    public Boolean verificaSetVazio() {
        Boolean vazia = cidades.isEmpty();
        return vazia;
    }
}
