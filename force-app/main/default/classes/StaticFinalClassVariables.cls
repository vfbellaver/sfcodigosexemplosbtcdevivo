public with sharing class StaticFinalClassVariables {
    public static Integer staticVariable = 5;
    public static final Integer staticFinalVariable;


    private static void defineVariaveis() {
        staticVariable = 2;
    }

    public void alteraStaticVariable() {
        System.debug('staticVariable before '+staticVariable);
        staticVariable = 3;
        System.debug('staticVariable after '+staticVariable);
    }

}
