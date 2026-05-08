# fetch() примери

## Пример 1

У текстуалном фајлу `recenica.txt` написана је једна реченица текста:

```text
Ово је једна реченица!
```

У HTML фајлу `index.html` дефинисан је елемент `<p>` на следећи начин:

```html
<p id="recenica"></p>
```

Напиши JS којим ће се садржај текстуалног фајла `recenica.txt` приказати у
елементу `<p>`.

```js
fetch('recenica.txt')
    .then(response => response.text())
    .then(podaci => {
        document.getElementById('recenica').innerText = podaci;
    });
```

## Пример 2

У текстуалном фајлу `spisak.txt` дат је списак ученика у следећем формату:

```text
Paja, Raja, Gaja, Vlaja, Zlaja
```

У HTML фајлу `index.html` дефинисан је елемент `<ul>` на следећи начин:

```html
<ul id="spisak"></ul>
```

Напиши JS којим ће се списак ученика из текстуалног фајла `spisak.txt`
приказати као листа у елементу `<ul>`.

```js
fetch('spisak.txt')
    .then(response => response.text())
    .then(podaci => {
        const ucenici = podaci.split(', ');
        const lista = document.getElementById('spisak');        
        ucenici.forEach(ucenik => {
            const li = document.createElement('li');
            li.innerText = ucenik;
            lista.appendChild(li);
        });
    });
```

## Пример 3

У CSV фајлу `podaci.csv​` дати су подаци о ученицима, где први ред представља
заглавље са називима колона (нпр. `Prezime​,Ime​,Razred​,Odeljenje​,Prosek​`).

```csv
Prezime,Ime,Razred,Odeljenje,Prosek
Marković,Ana,1,1,4.85
Jovanović,Petar,1,2,3.72
Nikolić,Milica,1,3,4.50
Petrović,Stefan,2,1,3.90
Đorđević,Jovana,2,2,4.20
Ilić,Nemanja,2,3,3.45
Stanković,Maja,3,1,4.10
Popović,Luka,3,2,3.60
Todorović,Nina,3,3,4.75
Lazarević,Milan,4,1,3.85
```

`script.js​` треба да прикаже све податке у табели користећи `fetch()`​
сортиране по првој колони (нпр. `Prezime`)​.

```js
fetch('podaci.csv')
    .then(odgovor => odgovor.text())
    .then(tekst => {
        const redovi = tekst.trim().split('\n');

        // Prvi red
        const zaglavlje = redovi[0].split(',');
        const trZaglavlje = document.createElement('tr');
        zaglavlje.forEach(naziv => {
            const th = document.createElement('th');
            th.textContent = naziv;
            trZaglavlje.appendChild(th);
        });
        document.getElementById('zaglavlje-tabele').appendChild(trZaglavlje);

        // Ostali redovi
        const podaci = redovi.slice(1).map(red => red.split(','));
        podaci.sort((a, b) => a[0].localeCompare(b[0], 'sr')); // Sortiranje
        const telo = document.getElementById('telo-tabele');
        podaci.forEach(kolone => {
            const tr = document.createElement('tr');
            kolone.forEach(vrednost => {
                const td = document.createElement('td');
                td.textContent = vrednost;
                tr.appendChild(td);
            });
            telo.appendChild(tr);
        });
    })
```

Табелу треба приказати у фајлу `index.html​`.

```html
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kontrolni</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <table id="tabela">
        <thead id="zaglavlje-tabele"></thead>
        <tbody id="telo-tabele"></tbody>
    </table>
    <script src="script.js"></script>
</body>
</html>
```

У `styles.css​` треба да се дефинишу оквири табеле и ништа више!

```css
table {
    border-collapse: collapse;
}

th, td {
    border: 1px solid black;
}
```
