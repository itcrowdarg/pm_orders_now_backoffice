export class FlashMessage {
  
  initialize() {
    setTimeout(function () {
      let toastElList = [].slice.call(document.querySelectorAll('.toast'))
      let toastList = toastElList.map(function (toastEl) {
        let toast = new bootstrap.Toast(toastEl, {autohide: true})

        toastEl.addEventListener('hidden.bs.toast', function () {
          this.remove();
        })
        return toast;
      })
      toastList.map(function (toast) {
        toast.show();
      })
    }, 300);
  }
}

