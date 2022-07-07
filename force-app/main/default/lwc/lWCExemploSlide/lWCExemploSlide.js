import { LightningElement, api, track } from 'lwc';
import buscaSobjects from '@salesforce/apex/HandshakerHandler.buscaSobjects';


export default class LWCExemploSlide extends LightningElement {
    @api titulocard;
    @api conteudoCard
    @api footerCard;
    @api campos;
    @api objeto;
    
    executaQuery(){
        let parametros = {
            'campos' : this.campos,
            'objeto' : this.objeto
        };
        
        buscaSobjects(parametros)
            .then(result => {
                console.log('resultado ',JSON.stringify(result));
            })
            .catch(error => {
                console.log('error ',JSON.stringify(error));
            });
    }
}