import flatpickr from 'flatpickr/dist/flatpickr.js';

const initDatepicker = () => {
  const dates = document.getElementById('disable-unavailable-dates');
let unavailable = [];
if (dates) {
  unavailable = JSON.parse(dates.dataset.dates);
};


flatpickr('.datepicker', {
  altInput: true,
    dateFormat: "Y-m-d",
    disable: unavailable,
    minDate: "today"
});
};

const initDatepickrHome = () => {
  flatpickr('.datepick', {
    altInput: true,
    dateFormat: "Y-m-d",
    minDate: "today"
});
};

export {initDatepicker}
export { initDatepickrHome }
