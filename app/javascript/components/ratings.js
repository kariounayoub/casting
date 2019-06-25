import "rateyo"
document.avgNotes = function avgNotes() {
  if(document.getElementById('note-inscription')) {
    if (!document.querySelector('#new_note')) {
      $("#avg-note-personalite").rateYo({numStars: 10, readOnly: true});
      $("#avg-note-personalite").rateYo('rating', parseFloat(document.getElementById('avg-note-personalite').dataset.rating)/2);

      $("#avg-note-cuisine").rateYo({numStars: 10, readOnly: true});
      $("#avg-note-cuisine").rateYo('rating', parseFloat(document.getElementById('avg-note-cuisine').dataset.rating)/2);
    }
  }
};

document.rateNote = function rateNote(noteId, inputId) {
  if(document.getElementById('modal-note')) {
    $(noteId).rateYo({numStars: 10, fullStar: true});
    if (!document.querySelector('#new_note')) {
      $(noteId).rateYo('rating', parseFloat(document.querySelector(inputId).value)/2);
    }
    $(noteId).rateYo("option", "onSet", function (rating) {
        document.querySelector(inputId).value = rating*2;
    });
  }
}

document.avgNotes();
document.rateNote('#rating-note-cuisine', '#note_note_cuisine')
document.rateNote('#rating-note-personalite', '#note_note_personalite')
