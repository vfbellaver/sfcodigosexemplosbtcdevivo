import  { LightningElement,wire,api }  from 'lwc';
import getOppsByName from '@salesforce/apex/ExercicioLwcOppController.getOppsByName';

export default class ExercicioLwcBuscaOppByName extends LightningElement {
    @api titulo;
    @api footer
    nomeOpp = '';
    listaOpps;

    columns = [
        {label: 'Name', fieldName: 'Name'},
        {label: 'Fase', fieldName: 'StageName'},
        {label: 'Valor', fieldName: 'Amount' ,type:'currency'}
    ];

    @wire(getOppsByName, {parametroLike:'$nomeOpp'}) 
    wiredOpps({data, error}) {
        if(data) {
         this.listaOpps = data;
        } 
        if(error) {
            console.log('error ',error);
        }
    } 

    buscaOpps(event) {
        if(event.target.value.length > 3) {
            this.nomeOpp = event.target.value;
        }
    }
}