
export class MathExt {

  static parseFloatOrZero(value){
    let parsedValue = parseFloat(value);
    parsedValue = (isNaN(parsedValue)) ? 0.0 : parsedValue;
    return parsedValue
  }

  static round(value, exp){
    return this.decimalAdjust('round', value, exp);
  }

  static floor(value, exp){
    return this.decimalAdjust('floor', value, exp);
  }

  static ceil(value, exp){
    return this.decimalAdjust('ceil', value, exp);
  }

   // Ajuste decimal de un número.
   //
   // @param {String}  tipo  El tipo de ajuste.
   // @param {Number}  valor El numero.
   // @param {Integer} exp   El exponente (el logaritmo 10 del ajuste base).
   // @returns {Number} El valor ajustado.

  static decimalAdjust(type, value, exp) {
    // Si el exp no está definido o es cero...
    if (typeof exp === 'undefined' || +exp === 0) {
      return Math[type](value);
    }
    value = +value;
    exp = +exp;
    // Si el valor no es un número o el exp no es un entero...
    if (isNaN(value) || !(typeof exp === 'number' && exp % 1 === 0)) {
      return NaN;
    }
    // Shift
    value = value.toString().split('e');
    value = Math[type](+(value[0] + 'e' + (value[1] ? (+value[1] - exp) : -exp)));
    // Shift back
    value = value.toString().split('e');
    return +(value[0] + 'e' + (value[1] ? (+value[1] + exp) : exp));
  }

  static formatToCurrency(currency, amount){
    let symbol_val = '';
    if (amount < 0){
      symbol_val = "-$"
    } else {
      symbol_val = "$"
    }

    amount = MathExt.round(Math.abs(amount), -2);
    let decimals = 2;



    let dec_point;
    let thousands_sep;

    let appLocale = document.querySelector('#app-locale');
    switch (appLocale.value) {
      case 'en':
        dec_point = '.';
        thousands_sep = ',';
        break;
      case 'es':
        dec_point = ',';
        thousands_sep = '.';
        break;
      default:
        dec_point = '.';
        thousands_sep = ',';
    }

    let strip_insignificant_zeros = false;

    let n = !isFinite(+amount) ? 0 : +amount
    let prec = !isFinite(+decimals) ? 0 : Math.abs(decimals)
    let sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep
    let dec = (typeof dec_point === 'undefined') ? '.' : dec_point
    let toFixedFix = function (n, prec) {
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        var k = Math.pow(10, prec);
        return Math.round(n * k) / k;
    }
    let s = (prec ? toFixedFix(n, prec) : Math.round(n)).toString().split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if(!strip_insignificant_zeros){
      if ((s[1] || '').length < prec) {
          s[1] = s[1] || '';
          s[1] += new Array(prec - s[1].length + 1).join('0');
      }
    }
    return symbol_val + " " + s.join(dec) + " " + currency;
  };
}
