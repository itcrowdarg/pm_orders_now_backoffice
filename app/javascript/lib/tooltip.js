export class Tooltip {
  initialize() {

    //Clean static tooltips
    let tooltipElList = [].slice.call(
      document.querySelectorAll('.tooltip.bs-tooltip-start, .tooltip.bs-tooltip-top, .tooltip.bs-tooltip-top, .tooltip.bs-tooltip-bottom')
    )
    
    for (const tooltipEl of tooltipElList) {
      tooltipEl.remove()
    }

    setTimeout(function () {
      let tooltipElList = [].slice.call(document.querySelectorAll('[data-bs-toggle=tooltip]:not([data-initiated=true])'))
      tooltipElList.map(function (tooltipEl) {
        tooltipEl.dataset.initiated = true
        return new bootstrap.Tooltip(tooltipEl)
      });
    }, 300);
  }
}
