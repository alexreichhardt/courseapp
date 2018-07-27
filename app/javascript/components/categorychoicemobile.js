function categoryChoiceMobile() {
  $(document).ready(function(){
    $(".category-choice-mobile").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export { categoryChoiceMobile }
