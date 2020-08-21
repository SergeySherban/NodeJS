const fs = require('fs');
let randomNumber = Math.random();
let writeFile = fs.writeFileSync("text.txt", randomNumber + '\n',{ flag: 'a+' }, "utf-8");
let readFile = fs.readFileSync("text.txt","utf-8");
console.log(readFile);
