$(function () {
    //Local PATH
    var tempdir = ctx+"blog/handle";
  /*  var pathArray = window.location.pathname.split('/');
    for (var i = 1; i < (pathArray.length - 1); i++) {
        tempdir += '/';
        tempdir += pathArray[i];
    }*/


    // Get the form.
    var form = $('#contact-form');

    // Get the messages div.
    var formMessages = $('.form-message');

    // Set up an event listener for the contact form.
    $(form).submit(function (e) {
        // Stop the browser from submitting the form.
        e.preventDefault();

        // Serialize the form data.
        var formData = $(form).serialize();

        // Submit the form using AJAX.
        $.ajax({
            type: 'POST',
            url: tempdir + '/contact',
            data: formData
        })
            .done(function (response) {
                // Make sure that the formMessages div has the 'success' class.
                $(formMessages).removeClass('alert alert-danger');
                $(formMessages).addClass('alert alert-success');

                // Set the message text.
                $(formMessages).text(response.msg);

                // Clear the form.
                $('#contact-form').trigger("reset");
            })
            .fail(function (data) {
                // Make sure that the formMessages div has the 'error' class.
                $(formMessages).removeClass('alert alert-success');
                $(formMessages).addClass('alert alert-danger');

                // Set the message text.
                if (data.msg !== '') {
                    $(formMessages).text(data.msg);
                } else {
                    $(formMessages).text('Oops! An error occurred and your message could not be sent.');
                }
            });
    });

});