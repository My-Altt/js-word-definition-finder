javascript:(function()%7Basync function fetch_demo()%0A%7B%0A%09const resp %3D await fetch('https%3A%2F%2Fapi.dictionaryapi.dev%2Fapi%2Fv2%2Fentries%2Fen%2Fdog')%3B%0A%0A%09console.log(await resp.json())%3B%0A%7D%0A%0Afetch_demo()%3B%7D)()%3B
