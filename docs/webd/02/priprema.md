# Припрема за контролни

## Припремни задатак из Веб дизајна

Твој задатак је да направиш сајт на тему *ТЕМА*

* Креирај три документа: `index.html`, `podaci.html` и `autor.html`.
* У заглављима сва три документа подеси језик, напиши наслове (Почетна, Подаци
и Аутор) и постави везу за CSS ка `styles.css`.
* У телу сва три документа, у семантичкој навигацији постави листу са три
ставке (Почетна, Подаци и Аутор) коју ћеш користити као мени. Затим у
семантичком заглављу постави наслове докумената величине 1 (Почетна, Подаци и
Аутор). У семантичком подножју сајта напиши *Ауторска права © 2025. Име
Презиме. Сва права задржана.*
* У документу `index.html`, у првој семантичкој секцији постави један наслов
величине 2 и пасус са најмање пет реченица (исписане ћириличним писмом) у вези
теме сајта. У следећој семантичкој секцији постави још један наслов величине 2
и једну слику у вези теме сајта.
* У документу `podaci.html`, у првој семантичкој секцији постави један наслов
величине 2 и једну табелу са заглављем димензија 5 колона $\times$ 5 редова, па
попуни ћелије табеле произвољним подацима. У следећој семантичкој секцији
постави један наслов величине 2 и креирај хипер-линк са текстом *Посетите сајт
…* који отвара линковани сајт у новом табу.
* У документу `autor.html`, у првој семантичкој секцији постави наслов величине
2 *О аутору* и испод твоје име презиме, и хипер-линк ка твом мејлу.

## Припремни задатак из Дизајна интефејса

У фајлу styles.css:

* Стилизуј страницу тако да позадина странице буде светло сива, а текст тамно
плав.
* Стилизуј навигацију, односно хоризонтални мени. Текст у навигацији треба да
беле боје, позадина тамно плаве боје, а када се преко неке ставке пређе мишем,
њена позадина треба да посветли. Текст у навигацији не све да буде подвучен,
нити смеју да се види виде симболи за набрајање •. Текст треба да буде исписан
фонтом Verdana, а ако он није доступан онда било којим сан-сериф фонтом.
* Стилизуј наслове величина 1 и 2 да користе фонт Arial, а ако он није доступан
онда било који доступан сан-сериф фонт.
* Стилизуј пасусе тако да користе фонт Times New Roman, а ако он није доступан
онда било који доступан сериф фонт.
* Стилизуј табеле тако да немају двоструке ивице и да садржај ћелија има размак
5 пиксела. Текст у табели треба да буде исписан фонтом Consolas, а ако он није
доступан онда било којим моноспејс фонтом.
* Стилизује слике тако да се приказују на средини странице у кругу пречника 320
пиксела.
* Стилизуј линкове тако да непосећени линк буде зелене боје, посећени линк тамно
зелене боје, а активни линк дречаво зелене боје.

## Решење

```html title="index.html"
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Почетна</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<nav>
    <ul>
        <li><a href="index.html">Почетна</a></li>
        <li><a href="podaci.html">Подаци</a></li>
        <li><a href="autor.html">Аутор</a></li>
    </ul>
</nav>

<header>
    <h1>Почетна</h1>
</header>

<main>
    <section>
        <h2>О граду Вршцу</h2>
        <p>Вршац је један од најстаријих градова у Војводини, познат по свом
            богатом културном наслеђу. Град се налази у подножју Вршачких
            планина, које су познате по својим виноградима и природним
            лепотама. Вршац има развијен туризам, посебно захваљујући
            знаменитостима као што су Вршачки замак и Кула. Познат је и као
            центар виноградарства и винарије са дугом традицијом. Град је важан
            културни, привредни и спортски центар јужног Баната.</p>
    </section>

    <section>
        <h2>Вршачка Кула</h2>
        <img src="https://upload.wikimedia.org/wikipedia/commons/5/54/Vr%C5%A1a%C4%8Dka_kula_posle_obnove2.jpg" alt="Вршачка кула">
    </section>
</main>

<footer>
    <p>Ауторска права © 2025. Велимир Радловачки. Сва права задржана.</p>
</footer>

</body>
</html>
```

```html title="podaci.html"
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <title>Подаци</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<nav>
    <ul>
        <li><a href="index.html">Почетна</a></li>
        <li><a href="podaci.html">Подаци</a></li>
        <li><a href="autor.html">Аутор</a></li>
    </ul>
</nav>

<header>
    <h1>Подаци</h1>
</header>

<main>
    <section>
        <h2>Табела података</h2>

        <table>
            <thead>
                <tr>
                    <th>Категорија</th>
                    <th>Подаци</th>
                    <th>Година</th>
                    <th>Локација</th>
                    <th>Напомена</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Становништво</td>
                    <td>36 000</td>
                    <td>2024</td>
                    <td>Вршац</td>
                    <td>Процена</td>
                </tr>
                <tr>
                    <td>Надморска висина</td>
                    <td>80–590 м</td>
                    <td>2025</td>
                    <td>Вршачке планине</td>
                    <td>Разликује се</td>
                </tr>
                <tr>
                    <td>Позната зграда</td>
                    <td>Вршачка кула</td>
                    <td>15. век</td>
                    <td>Вршац</td>
                    <td>Заштита културе</td>
                </tr>
                <tr>
                    <td>Индустрија</td>
                    <td>Винарство</td>
                    <td>2025</td>
                    <td>Јужни Банат</td>
                    <td>Развијено</td>
                </tr>
                <tr>
                    <td>Географија</td>
                    <td>Банат</td>
                    <td>2025</td>
                    <td>Србија</td>
                    <td>Источни део</td>
                </tr>
            </tbody>
        </table>
    </section>

    <section>
        <h2>Корисни линк</h2>
        <a href="https://www.vrsac.org.rs" target="_blank">Посетите сајт града Вршца</a>
    </section>
</main>

<footer>
    <p>Ауторска права © 2025. Велимир Радловачки. Сва права задржана.</p>
</footer>

</body>
</html>
```

```html title="autor.html"
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <title>Аутор</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<nav>
    <ul>
        <li><a href="index.html">Почетна</a></li>
        <li><a href="podaci.html">Подаци</a></li>
        <li><a href="autor.html">Аутор</a></li>
    </ul>
</nav>

<header>
    <h1>Аутор</h1>
</header>

<main>
    <section>
        <h2>О аутору</h2>
        <p>Велимир Радловачки</p>
        <a href="mailto:velimir.radlovacki@dontspamme.com">Пошаљи ми мејл</a>
    </section>
</main>

<footer>
    <p>Ауторска права © 2025. Велимир Радловачки. Сва права задржана.</p>
</footer>

</body>
</html>
```

```css title="styles.css"
body {
    background-color: #e6e6e6;
    color: #001a4d;
}
nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
    background-color: #001a4d;
}
nav li {
    margin: 0;
}
nav a {
    display: block;
    padding: 12px 20px;
    color: white;
    text-decoration: none;
}
nav a:hover {
    background-color: #3355aa;
}
h1, h2 {
    font-family: Arial, sans-serif;
}
p {
    font-family: "Times New Roman", serif;
}
table {
    border-collapse: collapse;
    font-family: Consolas, monospace;
}
table th, table td {
    border: 1px solid black;
    padding: 5px;
}
img {
    width: 320px;
    height: 320px;
    object-fit: cover;
    border-radius: 50%;
    display: block;
    margin: 0 auto;
}
main a:link {
    color: green;
}
main a:visited {
    color: darkgreen;
}
main a:active {
    color: lime;
}
```
