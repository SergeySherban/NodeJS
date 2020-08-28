let xhr = new XMLHttpRequest();
let url = 'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=3'
let currency = document.getElementById('currency')

xhr.open('GET', url, true); // true->async
xhr.send();

xhr.onreadystatechange = function() {
    if (xhr.readyState != 4) {           // 4->Done, the operation is complete.
        return;
    }
    if (xhr.status != 200) {
        alert(xhr.status + ': ' + xhr.statusText);
    } else {
        currency.innerHTML = xhr.responseText;
    }
}




