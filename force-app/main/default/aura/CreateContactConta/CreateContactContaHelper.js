({
    openAlert: function(cmp, msg, tema, rotulo) {
        console.log('OPEN ALERT')
        this.LightningAlert.open({
            message: msg,
            theme: tema,
            label: rotulo,
        }).then(function() {
            console.log('alert is closed');
        });
    }
})
