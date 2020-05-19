document.addEventListener('turbolinks:load', function() {
    const password = document.querySelector('#user_password');
    const confirmPassword = document.querySelector("#user_password_confirmation");
    if (password && confirmPassword) {
        password.addEventListener('change', check)
        confirmPassword.addEventListener('change', check)

    }

})

function check() {
    const password = document.querySelector('#user_password');
    const confirmPassword = document.querySelector("#user_password_confirmation");
    if (password.value === "" || confirmPassword.value === "")

    {
        confirmPassword.classList.remove('wrong_password');
        return
    }
    if (password.value !== confirmPassword.value) {
        confirmPassword.classList.remove('right_password');
        confirmPassword.classList.add('wrong_password');
    } else {
        confirmPassword.classList.remove('wrong_password');
        confirmPassword.classList.add('right_password');
    }
}