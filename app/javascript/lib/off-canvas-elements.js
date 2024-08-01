
export class OffCanvasElements {
  initialize() {
    let myOffCanvasEl = document.querySelector('#offcanvas-filter');
    if(myOffCanvasEl != undefined){
      myOffCanvasEl.addEventListener('shown.bs.offcanvas', function(){
        myOffCanvasEl.querySelector("[autofocus='autofocus']").focus();
      });
    }
  }
}
