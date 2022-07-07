public with sharing class ListVariablesClass {
    List<Account> listaClientes = new List<Account>();

    public List<Account> addClienteLista(Account cliente) {
        listaClientes.add(cliente);
        return listaClientes;
    } 

    public Integer verificaPosicaoList(Account cliente) {
        Integer posicao = listaClientes.indexOf(cliente);
        return posicao;
    }

    public void limpaListaClientes() {
        listaClientes.clear();
    }

    public Boolean clienteExisteLista(Account cliente) {
        Boolean clienteExiste = listaClientes.contains(cliente);
        return clienteExiste;
    }
}
