$.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
        return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
};

$.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
};

$.rails.showConfirmDialog = function(link) {
    var html, message;
    message = link.attr('data-confirm');
    bootbox.confirm(message, function(result) {
        if (result){
            return $.rails.confirmed(link);
        }
    });
};