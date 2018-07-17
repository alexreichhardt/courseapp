function accordion(section, heading, list) {
  $(section).each(function() {
    var that = this,
        listHeight = $(this).find(list).height();

    $(this).find(heading).click(function() {
      $(this).toggleClass('plus minus');
      $(that).find(list).slideToggle(250);
    });
  });
};

export { accordion };

// document.addEventListener("turbolinks:load", () => {
//   accordion('.filter-item', '.filter-item-inner-heading', '.filter-attribute-list');
// });
