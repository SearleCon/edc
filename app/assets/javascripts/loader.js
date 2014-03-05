var pleaseWaitDiv = $('<div class="modal fade" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false"><div class="modal-dialog"><div class="modal-content"><div class="modal-body"><div class="progress progress-striped active"><div class="progress-bar"  role="progressbar" style="width: 100%">Loading...</div></div></div></div></div></div>');

$(document).ajaxStart(function() {
    pleaseWaitDiv.modal();
});

$(document).ajaxStop(function() {
    pleaseWaitDiv.modal('hide');
});

