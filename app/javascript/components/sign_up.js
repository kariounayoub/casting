const allergie_intolerance = document.getElementById('user_allergie_intolerance');

if (allergie_intolerance != undefined) {
  allergie_intolerance.addEventListener('change', (e) => {
    const selector = document.getElementById('user_allergie_intolerance');
    const value = selector[selector.selectedIndex].value;
    if (value === true) {
      document.querySelector('.user_allergie_intolerance_contenu').classList.remove('hidden');
    }
    else {
      document.querySelector('.user_allergie_intolerance_contenu').classList.add('hidden');
    }
  });
}

const medicament =document.getElementById('user_medicament');

if (medicament != undefined) {
  medicament.addEventListener('change', (e) => {
    const selector = document.getElementById('user_medicament');
    const value = selector[selector.selectedIndex].value;
    if (value === true) {
      document.querySelector('.user_medicament_contenu').classList.remove('hidden');
    }
    else {
      document.querySelector('.user_medicament_contenu').classList.add('hidden');
    }
  });
}
