document.addEventListener('turbolinks:load', function() {
    let bar = document.querySelector(".greenBar");
    if (bar) {
    bar.style.width = bar.dataset.progressBar + "%";
    }
});