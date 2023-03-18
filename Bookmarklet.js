javascript:(function() {
  var word = prompt("Enter a word:");
  if (word) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "https://www.dictionaryapi.com/api/v3/references/collegiate/json/" + word + "?key=dac24cc9-c335-4327-9e61-6240c2a5a349", true);
    xhr.onload = function() {
      if (xhr.readyState === xhr.DONE) {
        if (xhr.status === 200) {
          var response = JSON.parse(xhr.responseText);
          var definition = response[0].shortdef[0];
          alert(definition);
        } else {
          alert('Error: ' + xhr.status);
        }
      }
    };
    xhr.send(null);
  }
})();
