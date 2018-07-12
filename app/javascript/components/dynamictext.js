import Typed from 'typed.js';

function loadDynamicBannerText() {
  console.log("hello")
  let bannerExists = document.getElementById('banner-typed-text');
  if (bannerExists) {
    new Typed('#banner-typed-text', {
      strings: ["Python", "Ruby", "Javascript"],
      typeSpeed: 150,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
