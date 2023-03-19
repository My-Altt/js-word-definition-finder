javascript:(function() {
  var word = prompt("Enter a word:");
  if (word !== null) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState === 4 && request.status === 200) {
        var response = request.responseText;
        var match = response.match(/<meta name="description" content="(.*?) See more\." \/>/);
        if (match !== null) {
          var definition = match[1];
          alert(definition);
        } else {
          alert("Definition not found.");
        }
      }
    };
    request.open("GET", "https://cors-proxy.htmldriven.com/?url=https://www.dictionary.com/browse/" + word);
    request.send();
  }
})();
