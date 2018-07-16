function categoryChoiceHome() {
  $(document).ready(function(){
    $(".category-choice-home").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export { categoryChoiceHome }
