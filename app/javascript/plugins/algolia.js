import places from 'places.js';
const placesAutocomplete = ()=>  {
  places({
  container: document.querySelector('#address-input')
  });
}
export { placesAutocomplete };
