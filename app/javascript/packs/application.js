// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initDatepicker } from '../custom/datepickr';
import { initDatepickrHome } from '../custom/datepickr';

import { initUpdateNavbarOnScroll } from '../components/navbar';
// import { initModalProfilePage } from '../components/modalpopup';
import { initMapbox } from './mapbox';
import { initMapIndex } from './mapbox';

document.addEventListener('turbolinks:load', () => {
  initUpdateNavbarOnScroll();
  initMapbox();
  initDatepicker();
  initMapIndex();
  initDatepickrHome();
  // Call your functions here, e.g:

  // initSelect2();


  const btnBoat = document.getElementById('btn-boat')

  btnBoat && btnBoat.addEventListener('click',
  function(){
    document.querySelector('.my-boats-modal').style.display = "flex";
    document.getElementById('profile-show-modal').style.display = "none";
  });

  const btnProfile = document.getElementById('btn-profile')

  btnProfile && btnProfile.addEventListener('click',
  function(){
    document.querySelector('.my-boats-modal').style.display = "none";
    document.getElementById('profile-show-modal').style.display = "block";
  });

  const searchButton = document.getElementById('search-submit');
  const searchForm = document.getElementById('search-form');

  searchButton && searchButton.addEventListener('click', () => {
    searchForm.submit()
  });

});
