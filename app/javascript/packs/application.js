import "bootstrap";
import Turbolinks from "turbolinks";


//= require turbolinks

import { readmore } from '../components/readmore';;

import { loadDynamicBannerText } from '../components/dynamictext';
loadDynamicBannerText();

import { pickTabs } from "../components/picktabs";
pickTabs();

import { categoryChoice } from "../components/categorychoice";
categoryChoice();

import { categoryChoiceHome } from "../components/categorychoicehome";
categoryChoiceHome();

import { filteraccordion } from "../components/filteraccordion";

import { uncheckallfilter } from "../components/uncheckallfilter"

import { listenToTurbolinks } from "../components/turbolinks"

Turbolinks.start();
Turbolinks.setProgressBarDelay(1);
listenToTurbolinks();
