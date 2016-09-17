var notificationsApi = function() {

    function init() {
        bindEvents();
    }

    function bindEvents() {
        $('#notifications-button').on('click', didClickNotificationsOnNotificationsButton);
    }

    function didClickNotificationsOnNotificationsButton() {
        var url = $(this).data('clear-url');
        $.ajax({
            type: 'POST',
            url: url
        })
    }

    return {
        init: init
    };

}();

$(function() {
    notificationsApi.init();
});
