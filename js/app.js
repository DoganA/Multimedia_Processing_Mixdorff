$(document).ready(function() {
    embedFiles();
});

function embedFiles() {
    $.each($("[data-embed]"), function(i, v) {
        var url = v.getAttribute("data-embed");
        requestFile(url, function(data) {
            v.innerHTML = data;
        });
    });
}

function requestFile(url, cb) {
    $.get(url, function(data) {
        cb(data);
    });
}
