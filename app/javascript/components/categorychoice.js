function categoryChoice() {
  $(document).ready(function(){
    $(".category-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export { categoryChoice }
