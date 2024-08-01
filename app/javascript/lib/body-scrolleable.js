
export class BodyScrolleable {
  initialize() {
    let _this = this;
    _this.calculateContainerHeight();
    _this.eventBindings();
  }

  eventBindings(){
    let _this = this;
    $(window).on('resize', function () {
      _this.calculateContainerHeight()
    });
  }

  calculateContainerHeight(){
    let _this = this;

    if($('#main-body-scrolleable').length == 1){
      _this.calculateBodyHeight();
    }
    else if($('.main-table-scrolleable').length == 1){
      _this.calculateTableHeight();
    }
  }

  calculateBodyHeight(){
    let windowHeight = $(window).height();
    let navbarHeight = $('#main-header').outerHeight();
    let footerHeight = $('#main-footer').outerHeight();

    if(isNaN(windowHeight)){
      windowHeight = 0;
    }
    if(isNaN(navbarHeight)){
      navbarHeight = 0;
    }
    if(isNaN(footerHeight)){
      footerHeight = 0;
    }

    let mainBodyHeight = windowHeight - navbarHeight - footerHeight;

    $('#main-body-scrolleable').css('height', mainBodyHeight+'px');
  }

  calculateTableHeight(){
    let windowHeight = $(window).height();
    let navbarHeight = $('#main-header').outerHeight();
    let footerHeight = $('#main-footer').outerHeight();
    let quickFilterHeight = $('#quick-filter').outerHeight();

    if(isNaN(windowHeight)){
      windowHeight = 0;
    }
    if(isNaN(navbarHeight)){
      navbarHeight = 0;
    }
    if(isNaN(footerHeight)){
      footerHeight = 0;
    }
    if(isNaN(quickFilterHeight)){
      quickFilterHeight = 0;
    }


    let mainTableHeight = windowHeight - navbarHeight - footerHeight - quickFilterHeight - 32;

    $('.main-table-scrolleable').css('height', mainTableHeight+'px');
  }
}
