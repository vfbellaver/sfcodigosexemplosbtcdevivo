({
	handleClick : function(component, event, helper) {
		let action = component.get("c.buscaOppsById");
		action.setParams({
			"accountId": component.get("v.recordId")
		});

		action.setCallback(this,function(response){
			if(response.getState() === "SUCCESS") {
				console.log('SUCESSO');
				component.set("v.oportunidades", response.getReturnValue());
			} else {
				console.log('Não deu sucesso');
			}
		});

		$A.enqueueAction(action);
	}
})