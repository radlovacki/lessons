# Чување измене у репозиторијуму

Нека је задатак да у репозиторијуму `Pitagora` креираш малу веб апликацију
(HTML, CSS и JS) за рачунање треће странице, обима и површине правоуглог
троугла помоћу Питагорине теореме.

Обичај је да се у репозиторијуму налази `README.md` фајл, где је описан садржај
репозиторијума, на пример:

``` md title="README.md"
# Правоуглу троугао

Веб апликација за рачунање треће странице, обима и површине правоуглог
троугла помоћу Питагорине теореме.
John Doe
```

Креирај тај фајл и сачувај га у репозиторијум `Pitagora`. Ако сада извршиш
`git status` команду, Git ће исписати поруку да у репозиторијуму постоји фајл
који се тренутно не прати:

``` text hl_lines="7"
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)
```

## Стејџовање

Да би Git почео да прати тај фајл потребно је да извршиш команду:

``` bash
git add README.md
```

Ако сада извршиш `git status` команду, Git ће исписати поруку да је у
репозиторијум додат нови фајл који треба да се комитује:

``` text hl_lines="7"
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   README.md
```

Каже се да је фајл **стејџован**, односно припремљен за комитовање, јер се
налази у секцији *Changes to be committed*. Након стејџовања фајла `README.md`,
у репозиторијуму `Geometrija` креирај `index.html`, `styles.css` и `script.js`,
па изврши `git status` команду.

``` text
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   README.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        index.html
        script.js
        styles.css
```

Добио си поруку да је фајл `README.md` стејџован и да се три фајла
`index.html`, `styles.css` и `script.js` не прате. Да не би губио време и
стејџовао сваки фајл појединачно, можеш да извршиш...

``` bash
git add .
```

...да стејџујеш све измене у тренутном директоријуму и његовим
поддиректоријумима, или...

``` bash
git add -A
```

...или...

``` bash
git add --all
```

...да стејџујеш све измене у целом репозиторијуму.

Након стејџовања, `git status` команда треба да испише следећу поруку:

``` text
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   README.md
        new file:   index.html
        new file:   script.js
        new file:   styles.css
```

## Комитовање

Сада кад је стејџ постављен онако како желиш, можеш да комитујеш измене
извршењем команде...

``` bash
git commit -m "Prvo komitovanje fajlova u repozitorijum"
```

...где ће Git исписати следећу поруку:

``` text
[master (root-commit) 92c9c2c] Prvo komitovanje fajlova u repozitorijum
 4 files changed, 206 insertions(+)
 create mode 100644 README.md
 create mode 100644 index.html
 create mode 100644 script.js
 create mode 100644 styles.css
```

Управо си направио свој први комит! Можеш видети да је приказано: у коју грану
је комитовано (`master`), која је SHA-1 контролна сума комита (`d1da96d`),
колико фајлова је измењено (`4 files changed`) и статистика о линијама које су
додате у комиту.

> **Напомена:** опција `-m` у `git commit` команди омогућава да поруку упишеш
> директно. Ако изоставиш `-m` отвориће се подешени едитор (нпр. Visual Studio
> Code), где ће се тражити да унесеш поруку.

Комит који си направио можеш да видиш извршавањем команде...

``` bash
git log
```

...која ће исписати овакву поруку:

``` text
commit d1da96d23c6fd223b93d072bc1824dd6460ad27d (HEAD -> master)
Author: John Doe <johndoe@teslavs.edu.rs>
Date:   Sun Jul 19 10:46:30 2026 +0200

    Prvo komitovanje fajlova u repozitorijum
```
