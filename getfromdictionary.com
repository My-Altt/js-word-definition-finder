javascript:(function() {
  var word = prompt("Enter a word:");
  if (word !== null) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState === 4 && request.status === 200) {
        var response = request.responseText;
        var parser = new DOMParser();
        var htmlDoc = parser.parseFromString(response, "text/html");
        var definition = htmlDoc.querySelector('.one-click-content .e1q3nk1v3').textContent;
        alert(definition);
      }
    };
    request.open("GET", "https://crossorigin.me/https://www.dictionary.com/browse/" + word);
    request.send();
  }
})();
