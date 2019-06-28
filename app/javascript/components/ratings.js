import "rateyo"
document.avgNotes = function avgNotes() {
  if(document.getElementById('note-inscription')) {
      function note(id) {
        if (document.getElementById(id) === null) {
          return 0
        } else {
          return  parseFloat(document.getElementById(id).dataset.rating)/2
        }
      }
      $("#avg-note-personalite").rateYo({numStars: 10, readOnly: true});
      $("#avg-note-personalite").rateYo('rating', note('avg-note-personalite'));
      $("#avg-note-cuisine").rateYo({numStars: 10, readOnly: true});
      $("#avg-note-cuisine").rateYo('rating',note('avg-note-cuisine'));
  }
};

document.rateNote = function rateNote(noteId, inputId) {
  if(document.getElementById('modal-note')) {
    $(noteId).rateYo({numStars: 10, fullStar: true});
    if (!document.querySelector('#new_note')) {
      $(noteId).rateYo('rating', parseFloat(document.querySelector(inputId).value)/2 || 0);
    }
              console.log('running')

    $(noteId).rateYo("option", "onSet", function (rating) {
        document.querySelector(inputId).value = rating*2;
    });
  }
}

document.avgNotes();
document.rateNote('#rating-note-cuisine', '#note_note_cuisine')
document.rateNote('#rating-note-personalite', '#note_note_personalite')
