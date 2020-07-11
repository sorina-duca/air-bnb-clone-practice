import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';

const dates = document.getElementById('disable-unavailable-dates');
const unavailable = JSON.parse(dates.dataset.dates);


flatpickr('.datepicker', {
  altInput: true,
    dateFormat: "Y-m-d",
    disable: unavailable,
    minDate: "today"
});

