export class CopyClipboardField {
  initialize() {
    let _this = this;

    let appLocale = document.querySelector('#app-locale').value

    const copyClipboardButtons = document.querySelectorAll('button.copy-clipboard-field');

    copyClipboardButtons.forEach(button => {
      button.addEventListener('click', (event) => {
        var button = event.currentTarget;

        var copyText = document.getElementById(button.dataset.copyFileId);
        var copyLegend;

        copyText.select();
        copyText.setSelectionRange(0, 99999); // For mobile devices
        navigator.clipboard.writeText(copyText.value);
        document.activeElement.blur();

        if(appLocale == 'es'){
          copyLegend = 'Copiado en el portapapeles';
        }
        else if(appLocale == 'en'){
          copyLegend = 'Copied to clipboard';
        }

        $('#flash-messages').html("\
          <div class='toast align-items-center mt-3 toast-info' data-bs-delay='800' role='alert' aria-live='assertive' aria-atomic='true'>\
            <div class='d-flex align-items-center'>\
              <div class='toast-body'>"+copyLegend+"</div>\
              <button type='button' class='btn-close me-2 m-auto' data-bs-dismiss='toast' aria-label='Close'></button>\
            </div>\
          </div>");

        layout_admin.initFlashMessage();

      });
    })
  }
}
