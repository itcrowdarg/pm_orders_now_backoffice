import moment from "vendors/momentjs/moment"
import DateRangePicker from "vendors/daterangepicker/daterangepicker"

export class InputDatepicker {
  initialize() {
    let _this = this;

    let appLocale = document.querySelector("#app-locale").value

    _this.ranges = {
      "en": {
        "today": "Today",
        "yesterday": "Yesterday",
        "last_7_days": "Last 7 Days",
        "last_30_days": "Last 30 Days",
        "this_month": "This Month",
        "last_month": "Last Month",
        "custom_range": 'Custom range'
      },
      "es": {
        "today": "Hoy",
        "yesterday": "Ayer",
        "last_7_days": "Ultimos 7 días",
        "last_30_days": "Ultimos 30 días",
        "this_month": "Mes actual",
        "last_month": "Mes anterior",
        "custom_range": 'Rango customizado'
      }
    }
    
    moment.locale(appLocale);


    if (window.daterangepickers == undefined){
      window.daterangepickers = {};
    }
    let daterangepickerElList = [].slice.call(document.querySelectorAll('[data-input=daterangepicker]'));
    daterangepickerElList.map(function (daterangepickerEl) {

      if(daterangepickerEl.dataset.inputDaterangepickerInit == undefined){
        let { start, end } = _this.getRangeStartEnd(daterangepickerEl.value, 'L');

        let daterangepickerObj = new DateRangePicker(daterangepickerEl, {
          locale: {
            customRangeLabel: _this.ranges[appLocale]["custom_range"],
            format: 'L'
          },
          autoUpdateInput: false,
          autoApply: true,
          startDate: start,
          endDate: end,          
          //parentEl: $(daterangepickerEl).closest('.form-floating'),
          ranges: {
           [_this.ranges[appLocale]["today"]]: [moment(), moment()],
           [_this.ranges[appLocale]["yesterday"]]: [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
           [_this.ranges[appLocale]["last_7_days"]]: [moment().subtract(6, 'days'), moment()],
           [_this.ranges[appLocale]["last_30_days"]]: [moment().subtract(29, 'days'), moment()],
           [_this.ranges[appLocale]["this_month"]]: [moment().startOf('month'), moment().endOf('month')],
           [_this.ranges[appLocale]["last_month"]]: [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          }
        })

        $(daterangepickerEl).on('apply.daterangepicker', function(ev, picker) {
          $(daterangepickerEl).val(_this.getRangeString(picker.startDate, picker.endDate, 'L', appLocale));
        });
        
        daterangepickerEl.dataset.inputDaterangepickerInit = true;

        window.daterangepickers[daterangepickerEl.id] = daterangepickerObj;
      }
    });


    if (window.datetimerangepickers == undefined){
      window.datetimerangepickers = {};
    }
    let datetimerangepickerElList = [].slice.call(document.querySelectorAll('[data-input=datetimerangepicker]'));
    datetimerangepickerElList.map(function (datetimerangepickerEl) {

      if(datetimerangepickerEl.dataset.inputDaterangepickerInit == undefined){
        let { start, end } = _this.getRangeStartEnd(datetimerangepickerEl.value, 'L LT');

        let datetimerangepickerObj = new DateRangePicker(datetimerangepickerEl, {
          locale: {
            customRangeLabel: _this.ranges[appLocale]["custom_range"],
            format: 'L LT'
          },
          autoUpdateInput: false,
          autoApply: true,
          timePicker: true,
          timePicker24Hour: true,
          autoUpdateInput: false,
          autoApply: true,
          startDate: start,
          endDate: end,
          //parentEl: $(datetimerangepickerEl).closest('.form-floating'),
          ranges: {
           [_this.ranges[appLocale]["today"]]: [moment().startOf('day'), moment().endOf('day')],
           [_this.ranges[appLocale]["yesterday"]]: [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf('day')],
           [_this.ranges[appLocale]["last_7_days"]]: [moment().subtract(6, 'days').startOf('day'), moment().endOf('day')],
           [_this.ranges[appLocale]["last_30_days"]]: [moment().subtract(29, 'days').startOf('day'), moment().endOf('day')],
           [_this.ranges[appLocale]["this_month"]]: [moment().startOf('month').startOf('day'), moment().endOf('month').endOf('day')],
           [_this.ranges[appLocale]["last_month"]]: [moment().subtract(1, 'month').startOf('month').startOf('day'), moment().subtract(1, 'month').endOf('month').endOf('day')]
          }
        })

        $(datetimerangepickerEl).on('apply.daterangepicker', function(ev, picker) {
          $(datetimerangepickerEl).val(_this.getRangeString(picker.startDate, picker.endDate, 'L LT', appLocale));
        });
        
        datetimerangepickerEl.dataset.inputDaterangepickerInit = true;
        
        window.datetimerangepickers[datetimerangepickerEl.id] = datetimerangepickerObj;
      }
    });



    if (window.datepickers == undefined){
      window.datepickers = {};
    }
    let datepickerElList = [].slice.call(document.querySelectorAll('[data-input=datepicker]'));
    datepickerElList.map(function (datepickerEl) {

      if(datepickerEl.dataset.inputDaterangepickerInit == undefined){
        let datepickerObj = new DateRangePicker(datepickerEl, {
          locale: {
            format: 'L'
          },          
          singleDatePicker: true,
          autoUpdateInput: false,
          autoApply: true,
          //parentEl: $(daterangepickerEl).closest('.form-floating')  
        })
        datepickerEl.dataset.inputDaterangepickerInit = true;

        $(datepickerEl).on('apply.daterangepicker', function(ev, picker) {
          $(datepickerEl).val(picker.startDate.format('L'));
        });

        window.datepickers[datepickerEl.id] = datepickerObj;
      }
    });


    if (window.datetimepickers == undefined){
      window.datetimepickers = {};
    }
    let datetimepickerElList = [].slice.call(document.querySelectorAll('[data-input=datetimepicker]'));
    datetimepickerElList.map(function (datetimepickerEl) {

      if(datetimepickerEl.dataset.inputDaterangepickerInit == undefined){
        let datetimepickerObj = new DateRangePicker(datetimepickerEl, {
          locale: {
            format: 'L LT'
          },          
          singleDatePicker: true,
          timePicker: true,
          timePicker24Hour: true,
          autoUpdateInput: false,
          autoApply: true,
          //parentEl: $(daterangepickerEl).closest('.form-floating')
        })
        datetimepickerEl.dataset.inputDaterangepickerInit = true;

        $(datetimepickerEl).on('apply.daterangepicker', function(ev, picker) {
          $(datetimepickerEl).val(picker.startDate.format('L LT'));
        });

        window.datetimepickers[datetimepickerEl.id] = datetimepickerObj;
      }
    });




  }

  getRangeStartEnd(string, format){
    let _this = this;
    var start, end;

    if (string == '') {
      start = moment().startOf('day');
      end = moment().endOf('day');

    } else if ((string == _this.ranges['es']["today"]) || (string == _this.ranges['en']["today"])){
      start = moment().startOf('day');
      end = moment().endOf('day');

    } else if ((string == _this.ranges['es']["yesterday"]) || (string == _this.ranges['en']["yesterday"])){
      start = moment().subtract(1, 'days').startOf('day');
      end = moment().subtract(1, 'days').endOf('day');

    } else if ((string == _this.ranges['es']["last_7_days"]) || (string == _this.ranges['en']["last_7_days"])){
      start = moment().subtract(6, 'days').startOf('day');
      end = moment().endOf('day');

    } else if ((string == _this.ranges['es']["last_30_days"]) || (string == _this.ranges['en']["last_30_days"])){
      start = moment().subtract(29, 'days').startOf('day');
      end = moment().endOf('day');
      
    } else if ((string == _this.ranges['es']["this_month"]) || (string == _this.ranges['en']["this_month"])){
      start = moment().startOf('month').startOf('day');
      end = moment().endOf('month').endOf('day');

    } else if ((string == _this.ranges['es']["last_month"]) || (string == _this.ranges['en']["last_month"])){
      start = moment().subtract(1, 'month').startOf('month').startOf('day');
      end = moment().subtract(1, 'month').endOf('month').endOf('day');
      
    } else {
      var string_splited = string.split(' - ');
      start = moment(string_splited[0], format)
      end = moment(string_splited[1], format)
    }
    return {start, end};
  }

  getRangeString(start, end, format, appLocale){
    let _this = this;

    if ((start.format(format) == moment().startOf('day').format(format)) && (end.format(format) == moment().endOf('day').format(format))) {
      return _this.ranges[appLocale]["today"]
    } else if ((start.format(format) == moment().subtract(1, 'days').startOf('day').format(format)) && (end.format(format) == moment().subtract(1, 'days').endOf('day').format(format))) {
      return _this.ranges[appLocale]["yesterday"]
    } else if ((start.format(format) == moment().subtract(6, 'days').startOf('day').format(format)) && (end.format(format) == moment().endOf('day').format(format))) {
      return _this.ranges[appLocale]["last_7_days"]
    } else if ((start.format(format) == moment().subtract(29, 'days').startOf('day').format(format)) && (end.format(format) == moment().endOf('day').format(format))) {
      return _this.ranges[appLocale]["last_30_days"]
    } else if ((start.format(format) == moment().startOf('month').startOf('day').format(format)) && (end.format(format) == moment().endOf('month').endOf('day').format(format))) {
      return _this.ranges[appLocale]["this_month"]
    } else if ((start.format(format) == moment().subtract(1, 'month').startOf('month').startOf('day').format(format)) && (end.format(format) == moment().subtract(1, 'month').endOf('month').endOf('day').format(format))) {
      return _this.ranges[appLocale]["last_month"]
    } else {
      return start.format(format) + ' - ' + end.format(format)
    }
  }
}



