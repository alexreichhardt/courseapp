function uncheckAll(){
   $('input[type="checkbox"]:checked').prop('checked',false);
   $(this).removeClass("active");
}

$('.uncheck-all').on('click', uncheckAll())
