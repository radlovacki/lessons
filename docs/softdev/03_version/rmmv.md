# Уклањање и премештање фајлова

До сада си учио како да поступаш са фајловима у репозиторијуму и променама на
постојећим фајловима. Понекад је потребно да фајл потпуно уклониш из пројекта,
или да га преместиш (нпр. преименујеш, или пребациш у други директоријум). Иако
то технички можеш да урадиш и без Git-а, брисањем или премештањем фајла помоћу
фајл менаџера или у конзоли, препоручљиво је да за то користиш Git команде, јер
оне аутоматски стejџују промену и Git прецизно бележи шта се тачно десило са
фајлом.

## Уклањање фајлова

Нека је задатак да из пројекта `Pitagora` уклониш фајл `komentari.md` којег
је креирао наставник након прегледа твог претходног задатка.

Ако фајл обришеш помоћу фајл менаџера или командом `del`, Git ће то приметити,
али промену нећеш моћи одмах да комитујеш - прво ћеш морати да је стejџујеш,
исто као и сваку другу промену:

``` text hl_lines="5"
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    komentari.md

no changes added to commit (use "git add" and/or "git commit -a")
```

Уместо да фајл прво ручно бришеш, па након тога унесеш команду `git add`, оба
корака можеш да спојиш у једну команду:

``` bash
git rm komentari.md
```

Ова команда истовремено брише фајл са диска и стejџује ту промену, након чега
ће `git status` приказати:

``` text hl_lines="4"
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        deleted:    komentari.md
```

Ову промену затим комитујеш као и сваку другу:

``` bash
git commit -m "Uklonjeni komentari nastavnika"
```

### Престанак праћења

Понекад желиш да Git престане да прати неки фајл, али да сам фајл остане на
твом рачунару, на пример фајл са твојим белешкама који не треба да буде део
репозиторијума. За то служи опција `--cached`:

``` bash
git rm --cached beleske.txt
```

Промена је аутоматски стejџована и припремљена за комит. Остаје само да је
комитујеш:

``` bash
git commit -m "Uklonjene beleske"
```

Овом командом фајл `beleske.txt` остаје нетакнут на диску, али га Git више не
прати.

``` text hl_lines="4"
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        beleske.txt

nothing added to commit but untracked files present (use "git add" to track)
```

> **Напомена:** Ако желиш да фајл убудуће Git трајно игнорише (да га
> `git status` уопште не пријављује), потребно је да га наведеш у `.gitignore`
> фајлу, о чему ће бити више речи у наредној лекцији.

## Премештање и преименовање фајлова командом `git mv`

Нека је следећи задатак да фајлове `styles.css` и `script.js` организујеш у
посебне директоријуме — `styles/styles.css` и `scripts/script.js`, ради
прегледније структуре пројекта.

И ово можеш да урадиш ручно, али би тада морао да извршиш више корака: креирање
директоријума, премештање фајлова, `git add` на нове путање и `git rm` на старе
путање, пошто Git промену путање види као брисање старог и додавање новог
фајла. Уместо тога, можеш да креираш директоријуме...

``` bash
mkdir styles
mkdir scripts
```

...и користиш команду `git mv`, која све то ради у једном кораку:

``` bash
git mv styles.css styles/styles.css
git mv script.js scripts/script.js
```

Резултат провери командом `git status`:

``` text hl_lines="4 5"
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        renamed:    script.js -> scripts/script.js
        renamed:    styles.css -> styles/styles.css

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        beleske.txt
```

Обе промене су аутоматски стejџоване и припремљене за комит, исто као код
`git rm`. Остаје само да их комитујеш:

``` bash
git commit -m "Organizacija CSS i JS fajlova u posebne direktorijume"
```

> **Напомена:** Нема разлике у крајњем резултату између коришћења `git mv` и
> ручног премештања фајла праћеног са `git add` и `git rm` - Git у оба случаја
> на крају препознаје да је фајл премештен (упоређивањем садржаја старог и
> новог фајла), а не да су у питању два потпуно независна фајла. `git mv` је ту
> само ради удобности, да не мораш ручно да извршаваш више одвојених команди.

Не заборави да, након премештања фајлова, ажурираш и путање унутар
`index.html` фајла (нпр. `<link>` и `<script>` елементе), пошто се локације
`styles.css` и `script.js` фајлова у пројекту сада разликују.
