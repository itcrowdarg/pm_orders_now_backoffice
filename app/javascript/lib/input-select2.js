

export class InputSelect2 {
  initialize() {
    let _this = this;

    let appLocale = document.querySelector('#app-locale').value

    let select2ElList = [].slice.call(document.querySelectorAll('select:not(.select-vanilla,.select-flags,.select-ajax,.select-ajax-custom-project-container)'))
    select2ElList.map(function (select2El) {

      if(select2El.dataset.inputSelect2Init == undefined){

        let tags = $(select2El).data('tags');
        if(tags == undefined){
          tags = false;
        }

        $(select2El).select2({
          minimumResultsForSearch: 10,
          dropdownParent: $(select2El).closest('.input-group'),
          language: appLocale,
          theme: "bootstrap-5",
          width: '100%',
          placeholder: select2El.getAttribute('placeholder'),
          allowClear: true,
          tags: tags
        });

        // To avoid fixed width problem

        // When open select options focus on search input
        $(select2El).on('select2:open', function (event) {
          $('.select2-search__field')[0].focus();
        });

        select2El.dataset.inputSelect2Init = true;

        $(select2El).on('select2:select', function () {
          let event = new Event('change', { bubbles: true })
          select2El.dispatchEvent(event);
          _this.toggleClassPopulated(select2El);
        });

        $(select2El).on('select2:unselect', function () {
          let event = new Event('change', { bubbles: true })
          select2El.dispatchEvent(event);
          _this.toggleClassPopulated(select2El);
        });

        _this.toggleClassPopulated(select2El);
      }
    });






    let select2FlagsElList = [].slice.call(document.querySelectorAll('select.select-flags'))
    select2FlagsElList.map(function (select2FlagsEl) {

      if(select2FlagsEl.dataset.inputSelect2Init == undefined){

        let tags = $(select2FlagsEl).data('tags');
        if(tags == undefined){
          tags = false;
        }

        $(select2FlagsEl).select2({
          minimumResultsForSearch: 10,
          dropdownParent: $(select2FlagsEl).closest('.input-group'),
          language: appLocale,
          theme: "bootstrap-5",
          width: '100%',
          placeholder: select2FlagsEl.getAttribute('placeholder'),
          allowClear: true,
          templateResult: _this.formatFlag,
          templateSelection: _this.formatFlag,
          tags: tags
        });

        // To avoid fixed width problem

        // When open select options focus on search input
        $(select2FlagsEl).on('select2:open', function (event) {
          $('.select2-search__field')[0].focus();
        });

        select2FlagsEl.dataset.inputSelect2Init = true;

        $(select2FlagsEl).on('select2:select', function () {
          let event = new Event('change', { bubbles: true })
          select2FlagsEl.dispatchEvent(event);
          _this.toggleClassPopulated(select2FlagsEl);
        });

        $(select2FlagsEl).on('select2:unselect', function () {
          let event = new Event('change', { bubbles: true })
          select2FlagsEl.dispatchEvent(event);
          _this.toggleClassPopulated(select2FlagsEl);
        });

        _this.toggleClassPopulated(select2FlagsEl);
      }
    });





    let select2AjaxElList = [].slice.call(document.querySelectorAll('select.select-ajax'))
    select2AjaxElList.map(function (select2AjaxEl) {

      if(select2AjaxEl.dataset.inputSelect2Init == undefined){
        let url = select2AjaxEl.dataset.url
        let placeholder = select2AjaxEl.getAttribute('placeholder')
        let minimumInputLength = select2AjaxEl.getAttribute('minimum_input_length')
        if (minimumInputLength == undefined){
          minimumInputLength = 0;
        }
        let sendParam = $(select2AjaxEl).data('sendParam')

        $(select2AjaxEl).select2({
          dropdownParent: $(select2AjaxEl).closest('.input-group'),
          language: appLocale,
          theme: "bootstrap-5",
          width: '100%',
          allowClear: true,
          ajax: {
            url: function (params) {
              return url
            },
            dataType: 'json',
            delay: 250,
            data: function (params) {
              if(sendParam == undefined){
                return {
                  filter: {
                    query: params.term
                  },
                  page: params.page || 1
                };
              }
              else{
                let filters = {
                  filter: {
                    query: params.term
                  },
                  page: params.page || 1
                };
                for (var attrname in sendParam) {
                  if ((sendParam[attrname].startsWith('#')) || (sendParam[attrname].startsWith('.'))){
                    filters['filter'][attrname] = $(sendParam[attrname]).val();
                  }
                  else if(sendParam[attrname].startsWith('>')) {
                    let aux_param = sendParam[attrname].substring(1);
                    aux_param = aux_param.split('>');
                    filters['filter'][attrname] = $(_this).closest(aux_param[0]).find(aux_param[1]).val();
                  }
                  else {
                    filters['filter'][attrname] = sendParam[attrname];
                  }
                }
                return filters
              }
            },
            processResults: function (data) {
              return {
                results: data.results,
                pagination: {
                  more: data.pagination.more
                }
              };
            },
          },
          templateResult: function(repo){
            return repo.text;
          },
          templateSelection: function(repo){
            return repo.text;
          },
          placeholder: placeholder,
          minimumInputLength: minimumInputLength
        });

        // When open select options focus on search input
        $(select2AjaxEl).on('select2:open', function (event) {
          if($('input.select2-search__field').length != 0){
            $('input.select2-search__field')[0].focus();
          }
        });

        select2AjaxEl.dataset.inputSelect2Init = true;


        $(select2AjaxEl).on('select2:select', function () {
          let event = new Event('change', { bubbles: true })
          select2AjaxEl.dispatchEvent(event);
          _this.toggleClassPopulated(select2AjaxEl);
        });

        $(select2AjaxEl).on('select2:unselect', function () {
          let event = new Event('change', { bubbles: true })
          select2AjaxEl.dispatchEvent(event);
          _this.toggleClassPopulated(select2AjaxEl);
        });

        _this.toggleClassPopulated(select2AjaxEl);
      }
    });


    let select2AjaxCustomProjectContainerElList = [].slice.call(document.querySelectorAll('select.select-ajax-custom-project-container'))
    select2AjaxCustomProjectContainerElList.map(function (select2AjaxEl) {

      if(select2AjaxEl.dataset.inputSelect2Init == undefined){
        let url = select2AjaxEl.dataset.url
        let placeholder = select2AjaxEl.getAttribute('placeholder')
        let minimumInputLength = select2AjaxEl.getAttribute('minimum_input_length')
        if (minimumInputLength == undefined){
          minimumInputLength = 0;
        }
        let sendParam = $(select2AjaxEl).data('sendParam')

        $(select2AjaxEl).select2({
          dropdownParent: $(select2AjaxEl).closest('.input-group'),
          language: appLocale,
          theme: "bootstrap-5",
          width: '100%',
          allowClear: true,
          maximumSelectionLength: 10,
          //closeOnSelect: false,
          ajax: {
            url: function (params) {
              return url
            },
            dataType: 'json',
            delay: 250,
            data: function (params) {
              if(sendParam == undefined){
                return {
                  filter: {
                    query: params.term
                  },
                  page: params.page || 1
                };
              }
              else{
                let filters = {
                  filter: {
                    query: params.term
                  },
                  page: params.page || 1
                };
                for (var attrname in sendParam) {
                  if ((sendParam[attrname].startsWith('#')) || (sendParam[attrname].startsWith('.'))){
                    filters['filter'][attrname] = $(sendParam[attrname]).val();
                  }
                  else if(sendParam[attrname].startsWith('>')) {
                    let aux_param = sendParam[attrname].substring(1);
                    aux_param = aux_param.split('>');
                    filters['filter'][attrname] = $(_this).closest(aux_param[0]).find(aux_param[1]).val();
                  }
                  else {
                    filters['filter'][attrname] = sendParam[attrname];
                  }
                }
                return filters
              }
            },
            processResults: function (data) {
              return {
                results: data.results,
                pagination: {
                  more: data.pagination.more
                }
              };
            },
          },
          templateResult: _this.formatRepo,
          templateSelection: _this.formatRepoSelection,
          placeholder: placeholder,
          minimumInputLength: minimumInputLength
        });



        select2AjaxEl.dataset.inputSelect2Init = true;


        $(select2AjaxEl).on('select2:select', function () {
          let event = new Event('change', { bubbles: true })
          select2AjaxEl.dispatchEvent(event);
          _this.toggleClassPopulated(select2AjaxEl);
        });

        $(select2AjaxEl).on('select2:unselect', function () {
          let event = new Event('change', { bubbles: true })
          select2AjaxEl.dispatchEvent(event);
          _this.toggleClassPopulated(select2AjaxEl);
        });

        _this.toggleClassPopulated(select2AjaxEl);
      }
    });

  }

  toggleClassPopulated(select2El){
    let _this = this;

    if((select2El.value != '') && (select2El.value != undefined)){
      $(select2El).closest(".form-floating").addClass('populated')
    }
    else {
      $(select2El).closest(".form-floating").removeClass('populated')
    }
  }


  formatRepo(repo) {
    let _this = this;
  
    if (repo.loading) {
      return repo.text;
    }

    let container = $(
      "<div class='d-flex align-items-center gap-2 select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__avatar'><img class='ratio ratio-1x1 rounded-2'style='width:120px'src='" + repo.image + "' /></div>" +
        "<div class='select2-result-repository__meta'>" +
        "<div class='select2-result-repository__title'></div>" +
        "<div class='select2-result-repository__tags'></div>" +
        "<div class='select2-result-repository__description'></div>" +
        "</div>" +
      "</div>"
    );
  
    container.find(".select2-result-repository__title").text(repo.text);
    container.find(".select2-result-repository__description").text(repo.kind);

    var tags_html = '';
    repo.tags.forEach(function(tag) {
      tags_html += "<span class='badge fw-medium bg-none border border-secondary'>"+tag+"</span>"
    })
    container.find(".select2-result-repository__tags").html(tags_html);

    return container;
  }
  
  formatRepoSelection(repo) {
    let _this = this;

    let container = $(
      "<div class='p-1 d-flex align-items-center gap-2 select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__avatar'><img class='ratio ratio-1x1 rounded-2'style='width:120px' src='" + repo.image + "' /></div>" +
        "<div class='select2-result-repository__meta'>" +
        "<div class='select2-result-repository__title'></div>" +
        "<div class='select2-result-repository__tags'></div>" +
        "<div class='select2-result-repository__description'></div>" +
        "</div>" +
      "</div>"
    );
  
    container.find(".select2-result-repository__title").text(repo.text);
    container.find(".select2-result-repository__description").text(repo.kind);

    var tags_html = '';
    repo.tags.forEach(function(tag) {
      tags_html += "<span class='badge fw-medium bg-none border border-secondary'>"+tag+"</span>"
    })
    container.find(".select2-result-repository__tags").html(tags_html);
  
    return container;
  }


  
  formatFlag(repo) {
    let _this = this;

    let container = $('<div><img src="/flags/' + repo.id + '.png" style="height: 18px;" /> ' + repo.text + '</div>');
  
    return container;
  }
}


