import "bootstrap";
import "awesomplete";
import "awesomplete/awesomplete.css";

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
