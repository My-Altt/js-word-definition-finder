javascript:(function() {
  var word = prompt("Enter a word:");
  if (word !== null) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState === 4 && request.status === 200) {
        var response = request.responseText;
        var definition = response.match(/<meta name="description" content="(.*?)"\/>/)[1];
        alert(definition);
      }
    };
    request.open("GET", "https://crossorigin.me/https://www.dictionary.com/browse/" + word);
    request.send();
  }
})();
