var imagesApi = function() {

    var images = [];

    function init() {
        setupFileUpload();
    }

    function setupFileUpload() {
        $("#new_image").fileupload({
            dataType: 'script',
            sequentialUploads: true,
            autoUpload: false,
            add: didAddImage
        });
    }

    function didAddImage(e, data) {
        images.push(data);
    }

    function sendNextImage() {
        images[0].submit();
        images.splice(0, 1);
    }

    function isUploadFinished() {
        return images.length == 0;
    }

    function clearImages() {
        images = []
    }

    return {
        init: init,
        sendNextImage: sendNextImage,
        clearImages: clearImages,
        isUploadFinished: isUploadFinished
    };

}();

$(function() {
    imagesApi.init();
});