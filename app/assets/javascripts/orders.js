/**
 * Created by jgibbons on 4/18/2014.
 */
/**
 * Created by jgibbons on 4/18/2014.
 */
$(document).ready(function(e) {
    $('#order_equipmentals_edit, #order_materials_edit, #order_labors_edit, #order_vendors_edit').nestedFields();
    $('.datepicker').datepicker({
        format: "mm/dd/yyyy",
        todayHighlight: true,
        todayBtn: 'linked',
        autoclose: true
    });
});
$(document).on('page:load', ready);
