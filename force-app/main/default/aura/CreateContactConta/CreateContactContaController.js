({
    handleCreateContact: function(component, event, helper) {
        console.log('chamei a controller');

        var contato = component.get("v.newContact");
        contato.AccountId = component.get("v.idConta");

        var saveContactAction = component.get("c.createContact");
            saveContactAction.setParams({
                "contact": contato
            });
        
        // Configure the response handler for the action
        saveContactAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                console.log('SUCESSO ');

                var msg = 'Contact created successfully';
                var tema = 'success';
                var rotulo = 'Deu bom';

                helper.openAlert(component, msg, tema, rotulo);
            }
            else if (state === "ERROR") {
                console.log('Problem saving contact, response state: ' + state);

                var msg = 'Não rolou';
                var tema = 'error';
                var rotulo = 'Não deu bom';

                helper.openAlert(component, event, msg, tema, rotulo);
            }
            else {
                console.log('Unknown problem, response state: ' + state);
            }
        });

        // Send the request to create the new contact
        $A.enqueueAction(saveContactAction);
    }
})
