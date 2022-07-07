({
    doInit : function(component, event, helper) {
        var action = component.get("c.retornaContatosConta");
        action.setParams({
            idConta: component.get("v.recordId")
        })

        action.setCallback(this, function(response){
            if(response.getReturnValue().length > 0) {
                component.set("v.existeContato", true);
                component.set("v.contatos", response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})
