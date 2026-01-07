document.addEventListener('turbolinks:load', function() {
    if (document.querySelector(".timer")) {

        let timerInput = document.querySelector(".timer"); // Get the element
        let TestPassageId = timerInput.dataset.testPassageId
        let time_end = timerInput.dataset.timer
        let timeMinut = parseInt(time_end)
        let timer = setInterval(function() {
            let seconds = timeMinut % 60 // Get seconds
            let minutes = timeMinut / 60 % 60 // Get minutes
            let hour = timeMinut / 60 / 60 % 60 // Get hours
            // Condition if time has run out...
            if (timeMinut <= 0) {
                // Timer is removed
                clearInterval(timer);
                // Redirect to test_passages/:id/result
                window.location = '/test_passages/' + TestPassageId + '/result'
            } else {
                // Otherwise
                // Create a string with time output
                // Output the string to the timer display block
                timerInput.innerText = `${Math.trunc(hour)}:${Math.trunc(minutes)}:${seconds}`;
            }
            --timeMinut; // Decrease timer
        }, 1000)

    }
});
