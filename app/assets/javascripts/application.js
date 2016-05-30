// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require active_scaffold
//= require record_select
//= require_tree .

$(document).ready(function() {

    jQuery(function($) {
        $.datepicker.regional['uk'] = {
            monthNamesShort: ['Січ','Лют','Бер','Кві','Тра','Чер',
                'Лип','Сер','Вер','Жов','Лис','Гру'],
            dayNamesMin: ['Нд','Пн','Вт','Ср','Чт','Пт','Сб']
        };
        $.datepicker.setDefaults($.datepicker.regional['uk']);
        $.datepicker.setDefaults({
            onChangeMonthYear: function(year, month, obj) {
                var day = obj.selectedDay;
                $(this).datepicker('setDate', new Date(year, month-1, day));
            }
        });
    });

});
