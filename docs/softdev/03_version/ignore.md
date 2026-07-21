# Игнорисање фајлова

У претходној лекцији си научио како командом `git rm --cached` можеш да уклониш
фајл из праћења, а да он ипак остане у репозиторијуму. Међутим, тај поступак ти
не помаже да фајл остане неопажен - `git status` ће га константно пријављивати:

``` text hl_lines="4"
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        beleske.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Да би решио овај проблем, треба да креираш фајл под именом `.gitignore` и у
њега унесеш списак фајлова које желиш да Git потпуно игнорише, као и
директоријуме чији садржај треба да буде игнорисан.

Вежбе ради, у репозиторијум `Pitagora` креирај и:

* директоријум `.vscode` и у њему неки фајл, нпр. `settings.json`,
* директоријум `privremeni` и у њему неки фајл, нпр. `linkovi.txt`,
* и фајлове `rezultati.log`, `poruke.log` и `vazno.log`.

`git status` ће сада генерисати следећу поруку:

``` text hl_lines="4 5 6 7 8 9"
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .vscode/
        beleske.txt
        poruke.log
        privremeni/
        rezultati.log
        vazno.log
```

Нека је задатак да Git игнорише све што се налази у директоријумима `.vscode` и
`privremeni`, фајл `beleske.txt` и све фајлове са екстензијом `.log` осим фајла
`vazno.log`.

У репозиторијум `Pitagora` креирај `.gitignore` фајл:

``` text title=".gitignore"
.vscode/
privremeni/
beleske.txt
*.log
!vazno.log
```

Ово значи да ће Git потпуно игнорисати све што се налази у директоријумима
`.vscode` и `privremeni`, фајл `beleske.txt` и све фајлове са екстензијом
`.log` осим фајла `vazno.log`:

``` text hl_lines="4 5"
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .gitignore
        vazno.log

nothing added to commit but untracked files present (use "git add" to track)
```

Додај фајл `vazno.log` у репозиторијум...

``` bash
git add vazno.log
git commit -m "Dodat vazno.log fajl"
```

...као и `.gitignore`, јер је и он новокреиран фајл те га треба додати, као и
сваки други фајл:

``` bash
git add .gitignore
git commit -m "Dodat .gitignore fajl"
```

Овим поступком си решио постављени задатак.

Можеш да приметиш да `.gitignore` подржава неколико једноставних правила:

``` text
# Ovo je komentar         # linije koje počinju sa # se ignorišu
.vscode/                  # ignoriše ceo direktorijum .vscode
privremeni/               # ignoriše ceo direktorijum privremeni
beleske.txt               # ignoriše tačno određen fajl
*.log                     # ignoriše sve fajlove sa datom ekstenzijom
!vazno.log                # izuzetak - ovaj fajl NEĆE biti ignorisan
```

Знак `*` представља џокер знак (*wildcard*) који замењује произвољан низ
карактера, косa црта на крају (`/`) означава да се правило односи на цео
директоријум, а знак `!` на почетку линије означава изузетак — правило које
поништава неко претходно, шире правило игнорисања.

## Провера да ли је фајл игнорисан

Ако нисиш сигуран зашто Git игнорише неки фајл (или зашто га **не**
игнорише, иако очекујеш да треба), користи команду:

``` bash
git check-ignore -v beleske.txt
```

Git ће исписати тачно које правило, из ког фајла, узрокује игнорисање:

``` text
.gitignore:3:beleske.txt        beleske.txt
```

## Игнорисање фајла који се већ прати

Важно је нагласити да `.gitignore` делује само на фајлове које Git **још увек
не прати**. Ако фајл додаш у `.gitignore` пошто је већ комитован у
репозиторијум, Git ће га и даље пратити и пријављивати сваку промену на њему,
без обзира на `.gitignore` правило. У том случају, тај фајл прво мораш да
уклониш из праћења командом коју си научио у претходној лекцији:

``` bash
git rm --cached fajl.ekstenzija
```

...па тек онда да га додаш у `.gitignore`.

> **Напомена:** На интернету постоје готови шаблони `.gitignore` фајлова за
> различите технологије и алате (нпр. за Node.js, Python, .NET итд), доступни
> на [github.com/github/gitignore](https://github.com/github/gitignore).
> Уместо да свако правило пишеш ручно, за већину пројеката је довољно да
> преузмеш одговарајући готов шаблон.

## Игнорисање фајлова у .NET пројектима

Пошто ћеш у III и IV разреду често користити програмски језик C#, односно
*Microsoft .NET* технологију у *Visual Studio* интегрисаном развојном окружењу,
треба да знаш да постоји команда...

``` bash
dotnet new gitignore
```

...која аутоматски креира `.gitignore` фајл прилагођен .NET пројектима и
*Visual Studio* интегрисаном развојном окружењу.

Зашто је битно креирати `.gitignore` у репозиторијумима са .NET пројектима? На
пример, за једноставну конзолну апликацију за прорачун хипотенузе, обима и
површине правоуглог троугла...

```cs
Console.WriteLine("Pravougli trougao");
Console.Write("Unesi duzinu katete a: ");
double a = double.Parse(Console.ReadLine()!);
Console.Write("Unesi duzinu katete b: ");
double b = double.Parse(Console.ReadLine()!);
double c = Math.Sqrt(a * a + b * b);
Console.WriteLine($"c = {c}");
Console.WriteLine($"O = {a + b + c}");
Console.WriteLine($"P = {a * b / 2}");
```

...Visual Studio је креирао двадесетак фолдера...

``` text
Pitagora
├───.vs
│   ├───Pitagora.slnx
│   │   ├───copilot-chat
│   │   │   └───7b7e94a2
│   │   │           └───sessions
│   │   ├───DesignTimeBuild
│   │   ├───FileContentIndex
│   │   └───v18
│   └───ProjectEvaluation        
├───bin
│   └───Debug
│       └───net10.0
└───obj
    └───Debug
        └───net10.0
            ├───ref
            └───refint
```

...и четрдесетак фајлова! Колико би тек фајлова било да је у питању иоле
сложенији пројекат?

Од свега наведеног, у овом случају, твој кôд се налази у једном једином фајлу
под називом `Program.cs`, а поред њега битни су и фајлови:

* `Pitagora.slnx`, решење тј. *Solution* фајл који повезује све пројекте унутар
једне целине,
* `Pitagora.csproj`, где се чувају информације о верзији .NET-а, NuGet пакетима
који се користе и подешавањима компајлера и
* `appsettings.json`, ако постоје и подешавања апликације.

Све остало није потребно чувати у репозиторијуму, јер су то привремени фајлови
интегрисаног развојног окружења, извршни фајлови настали као резултат
компајлирања, привремени објектни фајлови који се користе током процеса
компајлирања итд. Ти фајлови (и директоријуми у којима се налазе) ће се сами
аутоматски направити чим се отвори пројекат и покрене Build процес.

Препорука је да одмах након иницијализације репозиторијума унесеш команде:

``` bash
dotnet new gitignore
git add .gitignore
git commit -m "Dodat .gitignore fajl za .NET projekat"
```

``` text hl_lines="4 5 6"
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        Pitagora.csproj
        Pitagora.slnx
        Program.cs

nothing added to commit but untracked files present (use "git add" to track)
```

Овим поступком си све непотребно игнорисао, а остали су само битни фајлови
`Program.cs`, `Pitagora.slnx` и `Pitagora.csproj` које треба да додаш у
репозиторијум.

> **Напомена:** Уколико `.gitignore` фајл направиш **након** комитовања свега
> у репозиторију, само додавање правила неће бити довољно да Git престане да их
> прати - важиће исто ограничење као и у претходној лекцији - мораћеш да све
> непотребно уклониш из праћења командом `git rm --cached`, па након тога све
> непотребно наведеш у `.gitignore` фајлу.
