# Елемент div

Елемент [div](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/div)
је генерички контејнер за HTML елементе. Нема утицаја на садржај или распоред
елемената у њему, све док се на неки начин не стилизује помоћу CSS-а.

Као контејнер, елемент `div` не представља ништа - он се користи за груписање
садржаја у комбинацији са атрибутима `class` или `id`.

Атрибут `id` се користи као јединствен идентификатор (само једном на страници),
док се `class` може користити са више елемената. У следећем примеру...

```html
<!DOCTYPE html>
<html lang="sr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Елемент div</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1 class="naslovi">Елемент div</h1>
        <h2 class="naslovi">Увод</h2>
        <p>Елемент <code>div</code> је генерички контејнер за HTML елементе.
            Нема утицаја на садржај или распоред елемената у њему, све док се на
            неки начин не стилизује помоћу CSS-а.</p>        
        <h2 class="naslovi">Атрибути <code>id</code> и <code>class</code></h2>
        <p>Као контејнер, елемент <code>div</code> не представља ништа - он се
            користи за груписање садржаја у комбинацији са атрибутима
            <code>class</code> ли <code>id</code>. <code>id</code> се користи
            као јединствен идентификатор (само једном на страници), док се
            <code>class</code> може користити са више елемената.</p>
        <p id="mdnlink">Више о
            <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/div"><code>div</code></a>
            елементу можеш прочитати на MDN-у.</p>
</body>
</html>
```

...у свим насловима (`h1` и `h2`) на страници дефинисан је `class` атрибут, док
је у пасусу текста на дну странице дефинисан `id` атрибут. Ако се CSS напише
овако...

```css
.naslovi {
    color: darkblue;
    text-align: center;
}

#mdnlink {
    border: 1px solid black;
    font-style: italic;
}
```

...сви елементи са `class` атрибутом `naslovi` биће исписани тамно плавим
фонтом и биће центрирани, док ће елемент са атрибутом `mdnlink` бити уоквирен,
а његов фонт ће бити укошен.

Значи, елементима са `class="vrednost"` атрибутом у CSS-у приступа се са
`.vrednost`, а елементима са `id="vrednost"` атрибутом са `#vrednost`.
