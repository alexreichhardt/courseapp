function pickTabs() {
  let contenttab1 = document.getElementById("tab1-content");
  let contenttab2 = document.getElementById("tab2-content");
  let activetab = document.getElementsByClassName("tab active");

  let tab1 = document.getElementById("tab1");
  tab1.addEventListener("click", (event) => {
    activetab[0].classList.remove("active");
    tab1.classList.add("active");
    contenttab1.classList.remove("hide");
    contenttab2.classList.add("hide");
  });

  let tab2 = document.getElementById("tab2");
  tab2.addEventListener("click", (event) => {
    activetab[0].classList.remove("active");
    tab2.classList.add("active");
    contenttab2.classList.remove("hide");
    contenttab1.classList.add("hide");
  });
}

export { pickTabs };

