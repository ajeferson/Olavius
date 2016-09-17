var commentsApi = function() {


    function init() {
        bindEvents();
    }

    function cacheDOM() {
    }

    function bindEvents() {

    }

    function prependComment(commentHtml, postId) {
        $(".comments[data-post-id=" + postId + "]").prepend(commentHtml);
    }

    return {
        init: init,
        prependComment: prependComment
    }

}();

$(function() {
    commentsApi.init();
});