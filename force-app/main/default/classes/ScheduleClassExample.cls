public with sharing class ScheduleClassExample  implements Schedulable{
    
    public void execute(SchedulableContext sc) {
        System.debug('Sou um trabalho agendado.');
    }
}
