import Typed from 'typed.js';

function loadDynamicBannerText() {
  let bannerExists = document.getElementById('banner-typed-text');
  if (bannerExists) {
    new Typed('#banner-typed-text', {
      strings: ["Python", "Ruby", "Javascript"],
      typeSpeed: 200,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
