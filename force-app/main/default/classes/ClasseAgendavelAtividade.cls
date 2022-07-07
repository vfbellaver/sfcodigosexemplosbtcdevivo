public class ClasseAgendavelAtividade  implements Schedulable{
    
    public void execute(SchedulableContext sc) {
        ClasseChamadaSchedulableClass ccsc = new ClasseChamadaSchedulableClass();
        List<Opportunity> listaRetorno = ccsc.buscaOportunidades();
        ccsc.imprimeDadosOpp(listaRetorno);
        
    }
}