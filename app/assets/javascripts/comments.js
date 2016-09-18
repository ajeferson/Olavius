var commentsApi = function() {


    function init() {
        bindEvents();
    }

    function bindEvents() {
        $('.btn-edit-comment').on('click', didClickOnEditCommentButton);
        $('.btn-cancel-edit-comment').on('click', didClickOnCancelEditCommentButton);
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

    function didClickOnEditCommentButton() {
        var id = $(this).data('comment-id');
        $('.form-comment').addClass('hidden');
        var $form = $("form[data-comment-id='" + id + "']");
        $form.removeClass('hidden');
    }

    function didClickOnCancelEditCommentButton() {
        $(this).closest('form').addClass('hidden');
    }

    function hideCommentEditForm(commentId) {
        var $form = $("form[data-comment-id='" + commentId + "']");
        $form.addClass('hidden');
    }

    function updateCommentBody(commentId, text) {
        $("li[data-comment-id='" + commentId + "'] .comment-body").text(text)
    }

    return {
        init: init,
        prependComment: prependComment,
        deleteComment: deleteComment,
        clearCommentForm: clearCommentForm,
        hideCommentEditForm: hideCommentEditForm,
        updateCommentBody: updateCommentBody
    }

}();

$(function() {
    commentsApi.init();
});