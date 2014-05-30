/**
 * Created by jgibbons on 4/18/2014.
 */
$(document).ready(function(e) {
    $('#customer_contacts_edit').nestedFields();
});
$(document).ready(function(){
  $('#new_customer').validate({
    rules: {
      "customer[name]": {required: true},
      "customer[contacts_attributes][new_nested_item][name]": {required: true}
    }
  });
});
$(document).on('page:load', ready);
