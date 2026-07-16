# fetch() примери

## Увод

`fetch()` је уграђена JavaScript функција која омогућава преузимање садржаја из
фајлова и са сервера без поновног учитавања странице. Функција ради асинхроно -
уместо да чека да подаци стигну, JavaScript наставља са извршавањем, а када
подаци буду спремни, позива се `.then()`.

Основна синтакса је:

```js
fetch('naziv_fajla.txt')
    .then(response => response.text())   // čitanje odgovora kao tekst
    .then(podaci => {
        // upotreba podataka
    });
```

**Напомена**: `fetch()` не ради ако се HTML фајл отвори директно из фајл
система - потребан је веб сервер (нпр. *Live Server* у *VS Code*-у).

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

У текстуалном фајлу `broj.txt` записан је један број:

```text
42
```

У HTML фајлу `index.html` дефинисан је елемент `<p>` на следећи начин:

```html
<p id="rezultat"></p>
```

Напиши JS који ће прочитати број из фајла, удвостручити га и приказати у
елементу `<p>`.

```js
fetch('broj.txt')
    .then(response => response.text())
    .then(podaci => {
        const broj = Number(podaci.trim());
        document.getElementById('rezultat').innerText = broj * 2;
    });
```

## Пример 4

У текстуалном фајлу `recenice.txt` дате су реченице, свака у посебном реду:

```text
Programiranje je zabavno.
JavaScript je jezik veba.
fetch() preuzima podatke iz fajlova.
```

У HTML фајлу `index.html` дефинисан је елемент `<ol>` на следећи начин:

```html
<ol id="lista"></ol>
```

Напиши JS који ће сваку реченицу приказати као ставку нумерисане листе.

```js
fetch('recenice.txt')
    .then(response => response.text())
    .then(podaci => {
        const recenice = podaci.trim().split('\n');
        const lista = document.getElementById('lista');
        recenice.forEach(recenica => {
            const li = document.createElement('li');
            li.innerText = recenica;
            lista.appendChild(li);
        });
    });
```

## Пример 5

У текстуалном фајлу `temperatura.txt` дате су дневне температуре раздвојене
зарезом:

```text
18, 21, 25, 23, 19, 17, 22
```

У HTML фајлу `index.html` дефинисани су следећи елементи:

```html
<p id="min"></p>
<p id="max"></p>
<p id="prosek"></p>
```

Напиши JS који ће израчунати и приказати минималну, максималну и просечну температуру.

```js
fetch('temperatura.txt')
    .then(response => response.text())
    .then(podaci => {
        const temperature = podaci.split(', ').map(Number);
        const min = Math.min(...temperature);
        const max = Math.max(...temperature);
        const prosek = temperature.reduce((s, t) => s + t, 0) / temperature.length;

        document.getElementById('min').innerText = 'Minimum: ' + min + '°C';
        document.getElementById('max').innerText = 'Maksimum: ' + max + '°C';
        document.getElementById('prosek').innerText = 'Prosek: ' + prosek.toFixed(1) + '°C';
    });
```

## Пример 6

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

`script.js​` треба да прикаже све податке у табели користећи `fetch()`​
где су редови са одличним ученицима (Prosek >= 4.5)​ написани црвеним фонтом.

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
        const telo = document.getElementById('telo-tabele');
        podaci.forEach(kolone => {
            const tr = document.createElement('tr');
            const prosek = parseFloat(kolone[4]);
            if (prosek >= 4.5) {
                tr.style.color = 'red';
            }
            kolone.forEach(vrednost => {
                const td = document.createElement('td');
                td.textContent = vrednost;
                tr.appendChild(td);
            });
            telo.appendChild(tr);
        });
    });
```

## Пример 7

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

`script.js​` треба да прикаже све податке у табели користећи `fetch()`​
где су редови са ученицима првог разреда (Razred === 1) написани црвеним фонтом.

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
        const telo = document.getElementById('telo-tabele');
        podaci.forEach(kolone => {
            const tr = document.createElement('tr');
            const razred = parseInt(kolone[2]);
            if (razred === 1) {
                tr.style.color = 'red';
            }
            kolone.forEach(vrednost => {
                const td = document.createElement('td');
                td.textContent = vrednost;
                tr.appendChild(td);
            });
            telo.appendChild(tr);
        });
    });
```

## Пример 8

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

## Пример 9

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

`script.js​` треба да прикаже све податке у табели користећи `fetch()`​
сортиране по трећој колони (нпр. `Razred`)​.

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
        podaci.sort((a, b) => Number(a[2]) - Number(b[2])); // Sortiranje
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
