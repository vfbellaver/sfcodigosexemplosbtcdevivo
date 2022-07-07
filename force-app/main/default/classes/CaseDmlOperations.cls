public with sharing class CaseDmlOperations {
    
    public void insertCase() {
        Case caso = new Case();
        caso.Description = 'Insert';
        insert caso;
    }

    public void updatecase(Case caso) {
        caso.Description = 'Update';
        update caso;
    }

    public void deleteCase(Id idCase) {
        
        Case casoDelete = new Case();
        casoDelete.Id = idCase;

        delete casoDelete;
    }
}
