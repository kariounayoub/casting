import "rateyo"
$(function () {
  if(document.getElementById('avg-note-personalite')) {
    $("#avg-note-personalite").rateYo({numStars: 10, readOnly: true});
    $("#avg-note-personalite").rateYo('rating', parseFloat(document.getElementById('avg-note-personalite').dataset.rating)/2);
  }
  if(document.getElementById('avg-note-cuisine')) {
    $("#avg-note-cuisine").rateYo({numStars: 10, readOnly: true});
    $("#avg-note-cuisine").rateYo('rating', parseFloat(document.getElementById('avg-note-cuisine').dataset.rating)/2);
  }
});


