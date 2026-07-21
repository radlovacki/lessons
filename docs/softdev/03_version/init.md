# Креирање репозиторијума

До Git пројекта на свом рачунару можеш да дођеш на два начина:

1. креирањем новог Git репозиторијума у неком директоријуму на свом рачунару,
2. клонирањем Git репозиторијума са неког другог места на свој рачунар.

## Иницијализација новог репозиторијума

Нека је задатак да у директоријуму `C:\Projekti\` креираш нови пројекат
`Pitagora`.

Када покренеш конзолу тј. терминал (*Command Prompt* или *PowerShell*), обично
ће активни директоријум бити твој кориснички директоријум, на пример...

``` text
Microsoft Windows [Version 10.0.19045.7548]
(c) Microsoft Corporation. All rights reserved.

C:\Users\johndoe>
```

...или:

``` text
Copyright (C) Microsoft Corporation. All rights reserved.

Try the new cross-platform PowerShell https://aka.ms/pscore6

PS C:\Users\johndoe>
```

Прво треба да се позиционираш у директоријум `C:\Projekti\`...

``` text
cd C:\Projekti
```

...у њему креираш нови директоријум `Pitagora`...

``` text
mkdir cd C:\Pitagora
```

...позиционираш се у директоријум `Pitagora`...

``` text
cd Pitagora
```

...и на крају иницијализујеш Git репозиторијум:

``` bash
git init
```

Овим поступком је иницијализован нов репозиторијум и аутоматски креиран нов
директоријум `.git` који садржи све неопходне фајлове репозиторијума, што ће
бити и написано у поруци:

``` text
Initialized empty Git repository in C:/Projekti/Pitagora/.git/
```

Можеш и да провериш да ли је репозиторијум успешно иницијализован командом:

``` bash
git status
```

Пошто у директоријуму још увек нема фајлова, Git ће пријавити да нема ништа
за комитовање:

``` text
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

## Клонирање постојећег репозиторијума

Ако желиш да преузмеш копију постојећег Git репозиторијума, треба да се
позиционираш у жељени директоријум, нпр. `C:\Projekti\`...

``` text
cd C:\Projekti
```

...и онда извршиш команду `git clone <url>`, на пример:

``` bash
git clone https://github.com/radlovacki/pitagora
```

Git ће исписати поруку о току преузимања попут ове:

``` text
Cloning into 'pitagora'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 12 (delta 0), reused 9 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (12/12), done.
```

Клонирањем се не преузимају само тренутни фајлови пројекта, већ и цела историја
свих претходних измена, тако да одмах добијаш потпуну копију репозиторијума.
Приликом клонирања, Git аутоматски региструје адресу са које је репозиторијум
преузет под именом `origin`. То име ће ти требати касније, када будеш слао
(*push*) или преузимао (*pull*) измене.

Ако желиш да клонираш постојећи репозиторијум у репозиторијум са различитим
именом, треба да наведеш ново име након претходне команде, на пример:

``` bash
git clone https://github.com/radlovacki/pitagora Trougao
```

> **Напомена:** URL репозиторијума не мора да буде само у HTTPS формату (као у
> примерима изнад) - може бити и SSH формату (нпр.
> `git@github.com:radlovacki/pitagora.git`), о чему ћеш учити касније.
