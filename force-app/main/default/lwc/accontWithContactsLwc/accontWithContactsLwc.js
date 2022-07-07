import { api, LightningElement } from 'lwc';
import buscarContaApex from '@salesforce/apex/ExercicioLwcContactController.getAccountWithContactsById';

export default class AccontWithContactsLwc extends LightningElement {
    @api titulo
    @api footer
    idConta;
    registroConta;
    botaoDesabilitado = true;

    columns = [
        {label: 'Primeiro nome', fieldName: 'FirstName'},
        {label: 'Sobrenome', fieldName: 'LastName'},
        {label: 'Telefone', fieldName: 'Phone'},
    ];

    defineIdConta(event) {
        this.idConta = event.target.value;
        this.botaoDesabilitado = this.idConta ? false : true;
    }
    
    buscaConta() {
        let parameters = {
            'accountId': this.idConta
        };

        buscarContaApex(parameters).then(result => {
            this.registroConta = result;
        }).catch(error => {
            console.log('Ocorreu um erro. ' + error);
        });
    }
}