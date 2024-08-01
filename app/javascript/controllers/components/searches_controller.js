import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  
  connect() {
    if (!document.documentElement.hasAttribute("data-turbo-preview")) {
      console.log("Connect Searches controller");

      let _this = this;

      _this.initSearchItems();
    }
  }
  
  toggleSearchItem(event) {
    let _this = this;
    let controllerContainer = _this.context.element;

    let containerId = $('#container_id').val();
    let container = $(containerId)
    let actualSearchItemIds = $(container).val();
    
    let searchItem = $(event.currentTarget);

    let searchItemId = searchItem.data('id');
    let searchItemText = searchItem.data('text');
    let searchItemSelected = searchItem.data('selected');

    if (searchItemSelected == 'true'){
      searchItem.data('selected', 'false');
      searchItem.removeClass('table-primary');
      actualSearchItemIds = actualSearchItemIds.filter(element => element !== searchItemId.toString());
    }
    else {
      searchItem.data('selected', 'true');
      searchItem.addClass('table-primary');
      actualSearchItemIds.push(searchItemId.toString());
      if ($(container).find("option[value='"+searchItemId+"']").length == 0) {
        $(container).append("<option value='"+searchItemId+"'>'"+searchItemText+"'</option>");
      }
    }

    $(container).val(actualSearchItemIds).trigger('select2:select');

    // Limpiar
    //$(container).val(null).trigger('change');
  }

  initSearchItems() {
    let _this = this;
    let controllerContainer = _this.context.element;

    let containerId = $('#container_id').val();
    let container = $(containerId)
    let actualSearchItemIds = $(container).val();

    $(actualSearchItemIds).each(function(){
      let searchItem = $('#search_item_'+this);
      searchItem.addClass('table-primary');
      searchItem.data('selected', 'true');
    })
  }
  
}
