$(function () {
    $(document).ajaxError(function (event, jqxhr, settings, thrownError) {
        switch (jqxhr.status) {
            case 401:
                alert("Your cookie expired. Get Okay to Reload");
                window.location.reload();
                break;
            default:
                break;
        }
    });
});