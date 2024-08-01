export class TogglePasswordField {
  initialize() {
    const togglePasswordContentButtons = document.querySelectorAll('button.toggle-password-field');

    togglePasswordContentButtons.forEach(button => {
      button.addEventListener('click', (event) => {
        const button = event.currentTarget;

        const icon_hidden = button.querySelector('i.d-none');
        const icon_shown = button.querySelector('i.d-block');

        icon_hidden.classList.remove('d-none');
        icon_hidden.classList.add('d-block');

        icon_shown.classList.remove('d-block');
        icon_shown.classList.add('d-none');

        const current_shown_icon = button.querySelector("i.d-block")

        let inputGroup = button.closest(".input-group");

        inputGroup.querySelector('input.form-control').type = current_shown_icon.dataset.showPassword === 'false' ? 'text' : 'password';
      });
    })
  }
}
