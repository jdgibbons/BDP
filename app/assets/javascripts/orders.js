/**
 * Created by jgibbons on 4/18/2014.
 */
/**
 * Created by jgibbons on 4/18/2014.
 */
$(document).ready(function(e) {
    $('#order_equipmentals_edit, #order_materials_edit, #order_labors_edit, #order_vendors_edit').nestedFields();
});

$(document).ready(function(e) {
  $('.datepicker').datepicker({
    format: "mm/dd/yyyy",
    todayHighlight: true,
    todayBtn: 'linked',
    minDate: new Date(),
    autoclose: true
  });
});

$(document).ready(function(e) {
  $('tr.expander td').expander({
    expandEffect: 'fadeIn',
    collapseEffect: 'fadeOut'
  });
});
$(document).ready(function(){
  $('#new_order').validate({
    rules: {
      "order[customer]": {required: true},
      "order[quantity]": {required: true, min: 1}
    },
    messages: {
      "order[customer]": "field required",
      "order[quantity]": { required: "field required", min: "must be greater than 0" }
    }
  });
});

$(document).ready(function(e) {
  $('.donuts').trigger('refresh_autonumeric');
});

$(document).on('page:load', ready);


