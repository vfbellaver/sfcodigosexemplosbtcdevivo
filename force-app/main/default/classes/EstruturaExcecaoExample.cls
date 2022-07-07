public with sharing class EstruturaExcecaoExample {
    
    public void trycatchExample() {
       
        try {
            Account novaConta = new Account();
            novaConta.AccountSource = 'Site';
            novaConta.AnnualRevenue = 100000;
            novaconta.Description = 'Loren Ipsum';

            insert novaConta;
            
        } catch (Exception ex) {
            System.debug('1 - ' + ex.getMessage());
            System.debug('2 - ' + ex.getCause());
            System.debug('3 - ' + ex.getTypeName());
        }
    }

    public void tryCatchFinalyExample() {
        try {
            Account novaConta = new Account();
            novaConta.AccountSource = 'Site';
            novaConta.AnnualRevenue = 100000;
            novaconta.Description = 'Loren Ipsum';

            insert novaConta;
        } catch (System.DmlException ex) {
            System.debug('1 - ' + ex.getMessage());
            System.debug('2 - ' + ex.getTypeName());
        } catch (System.NullPointerException ex) {
            System.debug('1 - ' + ex.getMessage());
            System.debug('2 - ' + ex.getTypeName());
        } finally {
            System.debug('CHO ODAAAAAMA RASEEEENGAN');
        }
    }

    public void tryFinalyExample() {
        try {
            Account novaConta = new Account();
            novaConta.AccountSource = 'Site';
            novaConta.AnnualRevenue = 100000;
            novaconta.Description = 'Loren Ipsum';

            insert novaConta;

        } finally {
            System.debug('CHO ODAAAAAMA RASEEEENGAN');
        }
    }
}
