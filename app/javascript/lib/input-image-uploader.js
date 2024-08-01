export class InputImageUploader {
  initialize() {
    let _this = this;



    let imageUploaderElList = [].slice.call(document.querySelectorAll('[data-input=image-uploader]'));
    imageUploaderElList.map(function (imageUploaderEl) {

      if(imageUploaderEl.dataset.imageUploaderElInit == undefined){

        var file = $(imageUploaderEl).find('.input-file')
        var preview = $(imageUploaderEl).find('.input-preview')
        preview.css('cursor', 'pointer');

        file.on('change', function (event) {
          _this.dragNdrop(event, preview);
        });

        preview.on('click', function () {
          file[0].click();
        });
        
        imageUploaderEl.dataset.imageUploaderElInit = true;
      }
    });

  }

  dragNdrop(event, preview) {
    let _this = this;

    var fileName = URL.createObjectURL(event.target.files[0]);
    preview[0].setAttribute("src", fileName);
  }
}

