// script.js
window.addEventListener('load', adjustImageLayout);

function adjustImageLayout() {
    var maxHeight = 0;
    var columns = document.querySelectorAll('.col-6 img');

    columns.forEach(function (img) {
        maxHeight = Math.max(maxHeight, img.clientHeight);
    });

    columns.forEach(function (col) {
        col.parentElement.style.height = maxHeight + 'px';
    });
}
