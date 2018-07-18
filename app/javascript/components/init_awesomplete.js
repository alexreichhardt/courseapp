import "awesomplete";
import "awesomplete/awesomplete.css";

function initAwesomplete() {
  let inputs = document.querySelectorAll("input.awesomplete");
  if (inputs) {
    inputs.forEach(function(input) {
      let categories = input.dataset.categories.split(", ");
      new Awesomplete(input, {list: categories});
    });
  }
};

export { initAwesomplete };
