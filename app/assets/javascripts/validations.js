$.validator.setDefaults({
    debug: true,
    highlight: function(element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function(element) {
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
    },
    errorClass: 'help-block'
});

$.validator.addMethod('exclusionIn', function(value, element, params) {
       return $.inArray(value, params) == -1;
    },
    $.validator.format("{0} is reserved."));


$.validator.addMethod('format', function(value, element, param) {
        var regex = new RegExp(param);
        return regex.test(value) ;
    },
    $.validator.format("This field must be lowercase alphanumerics only."));
