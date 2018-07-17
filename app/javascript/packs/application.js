import "bootstrap";
import Turbolinks from "turbolinks";
import "awesomplete";
import "awesomplete/awesomplete.css";

//= require turbolinks

import { enableReadMore } from '../components/readmore';
import { loadDynamicBannerText } from '../components/dynamictext';
import { pickTabs } from "../components/picktabs";
import { categoryChoice } from "../components/categorychoice";
import { categoryChoiceHome } from "../components/categorychoicehome";
import { accordion } from "../components/filteraccordion";
import { uncheckallfilter } from "../components/uncheckallfilter"

categoryChoice();
categoryChoiceHome();

// import { listenToTurbolinks } from "../components/turbolinks"

Turbolinks.start();
Turbolinks.setProgressBarDelay(1);
// listenToTurbolinks();

document.addEventListener("turbolinks:load", () => {
  pickTabs();
  accordion('.filter-item', '.filter-item-inner-heading', '.filter-attribute-list');
  enableReadMore();
  loadDynamicBannerText();
});
