javascript:(function() {
var word = prompt("Enter a word:");
if (word !== null) {
  fetch("https://api.dictionaryapi.dev/api/v2/entries/en/" + word)
    .then(response => response.json())
    .then(data => {
      var partOfSpeech = data[0].meanings[0].partOfSpeech;
      var definition = data[0].meanings[0].definitions[0].definition;
      var example = data[0].meanings[0].definitions[0].example;
      alert(word + " - (" + partOfSpeech + ")- " + definition + "" + example);
    })
    .catch(error => alert("An error occurred while fetching the definition."));
}
})();
