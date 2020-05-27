document.addEventListener('turbolinks:load', function() {
    if (document.querySelector(".timer")) {

        let timerInput = document.querySelector(".timer"); // Берём строку
        let TestPassageId = timerInput.dataset.testPassageId
        let time_end = timerInput.dataset.timer
        let timeMinut = parseInt(time_end)
        let timer = setInterval(function() {
            let seconds = timeMinut % 60 // Получаем секунды
            let minutes = timeMinut / 60 % 60 // Получаем минуты
            let hour = timeMinut / 60 / 60 % 60 // Получаем часы
            // Условие если время закончилось то...
            if (timeMinut <= 0) {
                // Таймер удаляется
                clearInterval(timer);
                // Redirect to test_passages/:id/result
                window.location = '/test_passages/' + TestPassageId + '/result'
            } else {
                // Иначе
                // Создаём строку с выводом времени
                // Выводим строку в блок для показа таймера
                timerInput.innerText = `${Math.trunc(hour)}:${Math.trunc(minutes)}:${seconds}`;
            }
            --timeMinut; // Уменьшаем таймер
        }, 1000)

    }
});
