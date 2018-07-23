function loadBookmarkIcon() {
  $(".single-icon-index").on("click", "i", function(){
    $(this).toggleClass("fas fa-bookmark").toggleClass("far fa-bookmark")
  });
};

export { loadBookmarkIcon };

