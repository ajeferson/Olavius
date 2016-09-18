var commentsApi = function() {


    function init() {
        bindEvents();
    }

    function cacheDOM() {
    }

    function bindEvents() {

    }

    function prependComment(commentHtml, postId) {

        var $commentsCount = $("div[data-id='" + postId + "'] .comments-count");
        $commentsCount.text(parseInt($commentsCount.text()) + 1);

        $(".comments[data-post-id=" + postId + "]").prepend(commentHtml);

    }

    function deleteComment(postId, commentId) {

        var $commentsCount = $("div[data-id='" + postId + "'] .comments-count");
        $commentsCount.text(parseInt($commentsCount.text()) - 1);

        $(".comments[data-post-id='" + postId + "'] li[data-comment-id='" + commentId + "']").fadeOut('fast', function() {
            $(this).remove();
        });
    }

    function clearCommentForm(postId) {
        $("div[data-id='" + postId + "'] input[type='text']").val('');
    }

    return {
        init: init,
        prependComment: prependComment,
        deleteComment: deleteComment,
        clearCommentForm: clearCommentForm
    }

}();

$(function() {
    commentsApi.init();
});