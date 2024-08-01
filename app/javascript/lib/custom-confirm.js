export class CustomConfirm {
  initialize() {
    const newConfirmMethod = async (message, formElement) => {

      let modalConfirmEl = document.getElementById('modal_confirm');
      if(!modalConfirmEl.classList.contains('opened')){

        let modalConfirm = new bootstrap.Modal(modalConfirmEl);
        modalConfirmEl.classList.add('opened');

        modalConfirmEl.addEventListener('shown.bs.modal', event => {
          modalConfirmEl.querySelector('.confirm').focus({focusVisible: true});
        })
        modalConfirmEl.addEventListener('hide.bs.modal', event => {
          modalConfirmEl.classList.remove('opened')
        })
  
        let message_array = message.split('//');
        let message_title = message_array[0];
        let message_body = message_array[1];
        let message_button = message_array[2];
        let message_class = message_array[3];
  
        let titleElement = modalConfirmEl.querySelector('.modal-title');
        titleElement.innerHTML = message_title
        
        let p = modalConfirmEl.querySelector('.modal-body p')
        p.innerHTML = message_body;

        let button = modalConfirmEl.querySelector('.confirm')
        button.innerHTML = message_button;
        
        modalConfirm.show();
      
        return new Promise((resolve, reject) => {
          const confirmButton = modalConfirmEl.querySelector('.confirm');
          confirmButton.classList.remove('btn-primary');
          confirmButton.classList.remove('btn-danger');
          confirmButton.classList.add(message_class);
          const cancelButton = modalConfirmEl.querySelector('.cancel');
          confirmButton.addEventListener('click', () => {
            resolve(true)
          });
      
          cancelButton.addEventListener('click', () => {
            resolve(false)
          });
        });
      }
    };
    
    Turbo.setConfirmMethod(newConfirmMethod);
  }
}

