import flatpickr from 'flatpickr/dist/flatpickr.js';

const initDatepicker = () => {
  const dates = document.getElementById('disable-unavailable-dates');
  let unavailable = [];
  if (dates) {
    unavailable = JSON.parse(dates.dataset.dates);
  };

// ensure it deletes all "text" fields with .datepicker so you don't get duplicates
// when navigating with 'back' in the browser history

  document.querySelectorAll('.datepicker[type="text"]').forEach(el => {
    el.parentNode.removeChild(el)
  })

// select only the "hidden" type flatpickr creates
  flatpickr(".datepicker[type='hidden']", {
    altInput: true,
    dateFormat: "Y-m-d",
    disable: unavailable,
    minDate: "today"
  });
};

// const initDatepickrHome = () => {
//   flatpickr('.datepick', {
//     altInput: true,
//     dateFormat: "Y-m-d",
//     minDate: "today"
// });
// };

export {initDatepicker}
// export { initDatepickrHome }
