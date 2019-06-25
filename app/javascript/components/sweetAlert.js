import swal from 'sweetalert2';


document.sweetAlert = function sweetAlert(text) {
  swal(
    '',
    text,
    'success'
  )
};

document.sweetError = function sweetError(text) {
  swal(
    '',
    text,
    'error'
  )
};
