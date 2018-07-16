// function uncheckAll(){
//    $('input[type="checkbox"]:checked').prop('checked',false);
//    $('.active').removeClass("active");
// }

// $('.uncheck-all').on('click', uncheckAll())


$(document).on('click', '.uncheck-all', function () {
  $('input[type="checkbox"]:checked').prop('checked',false);
  $('.active').removeClass("active");
});
