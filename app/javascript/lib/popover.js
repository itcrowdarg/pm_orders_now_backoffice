export class Popover {
  initialize() {

    //Clean static popover
    let popoverElList = [].slice.call(
      document.querySelectorAll('.popover.bs-popover-start, .popover.bs-popover-end, .popover.bs-popover-top, .popover.bs-popover-bottom')
    )
    
    for (const popoverEl of popoverElList) {
      popoverEl.remove()
    }

    setTimeout(function () {
      let popoverElList = [].slice.call(document.querySelectorAll('[data-bs-toggle=popover]:not([data-initiated=true])'))
      popoverElList.map(function (popoverEl) {
        popoverEl.dataset.initiated = true
        return new bootstrap.Popover(popoverEl)
      });
    }, 300);
  }
}
