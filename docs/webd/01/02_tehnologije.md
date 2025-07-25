# Веб технологије

## Веб страница, веб сајт и веб прегледач

**Веб** је у свом најједноставнијем облику систем међусобно повезаних
хипертекстуалних докумената који се налазе на интернету.

**Хипертекстуални документ** је текстуална датотека формирана **HTML језиком**
тј. језиком за опис хипертекста** (енгл. *HyperText Markup Language*). **Веб
страница** је појединачни хипертекстуални документ на вебу који може да
садржи текст, линкове, слике и друге дигиталне садржаје. Свака веб страница
може да се идентификује помоћу јединствене адресе која се назива URL (енгл.
*Uniform Resource Locator*). О овоме ћеш учити више у следећој лекцији.

Садржај хипертекстуалног документа корисници могу да виде уз помоћ програма
који се назива **веб прегледач** (енгл. *Web Browser*). Најпознатији веб
прегледачи данас су Google Chrome, Microsoft Edge, Mozilla Firefox и др.

**Веб сајт** представља скуп повезаних веб страница које чине целину и налазе
се на истом домену. Све странице једног сајта најчешће имају сличан изглед и
међусобно су повезане менијима и линковима.

## Веб сервер

Веб странице заједно са пратећим садржајима веб прегледачу испоручује
**веб сервер** - серверски софтвер инсталиран на рачунару, чија је основна
улога да прихвата захтеве клијената (најчешће веб прегледача) и испоручује им
веб садржај путем HTTP (енгл. *HyperText Transfer Protocol*) или HTTPS (енгл.
*Hypertext Transfer Protocol Secure*) протокола. Најпознатији веб сервери су
Apache, Nginx и Microsoft IIS. Поред испоруке унапред припремљених HTML
страница и пратећих садржаја (CSS, JS, слике и сл.), веб сервер извршава и
следеће задатке:

* Врши обраду динамичких захтева тј. покреће апликација на страни сервера (нпр.
PHP, ASP.NET, Node.js), које креирају HTML садржај у реалном времену, најчешће
у зависности од података из базе или корисничког захтева.
* Управља комуникацијом са клијентом тј. прихвата HTTP/HTTPS захтеве, шаље
одговоре, постављање "колачића", рукује сесијама и безбедносним механизмима као
што су аутентификација и ауторизација, шифровање и др.
* Врши редирекције и рутирање преусмеравањем захтева ка различитим ресурсима
или обрадом URL-ова на основу дефинисаних правила.
* Врши кеширање и оптимизацију тј. чува честе одговоре како би се убрзала
испорука садржаја и смањило оптерећење.

Веб сервери првенствено користе HTTP на TCP порту 80 и HTTPS на TCP порту 443
за комуникацију са прегледачима, мада то не мора да буде стриктно правило. У
односу на HTTP, HTTPS шифрује веб саобраћај и додаје слој безбедности помоћу
SSL/TLS (енгл. *Secure Sockets Layer/Transport Layer Security*) механизама.
Обично је на веб серверу обезбеђена могућност логовања саобраћаја у циљу
праћења стања сервера и метрике перформанси.

## Веб протоколи

**Протокол** представља скуп правила за управљање комуникацијом у рачунарској
мрежи. Да би два рачунарска система могла да комуницирају морају користе исти
комуникациони протокол.

**HTTP** (енгл. *Hypertext Transfer Protocol*) је основни протокол на вебу који
се користи за комуникацију између веб прегледача и веб сервера. Ради по
принципу захтев/одговор, где је основни циљ испорука веб страница. Обично
корисник иницира комуникацију уносом веб адресе у адресну линију веб
прегледача. Веб прегледач успоставља везу са веб сервером путем TCP/IP
протокола. Потом веб сервер "ослушкује" захтеве клијента на одређеном порту,
међу којима су најчешћи:

* `GET` (достављање ресурса),
* `POST` (достављање података у телу захтева),
* `HEAD` (достављање заглавља без тела захтева),
* `PUT` (постављање података),
* `DELETE` (брисање ресурса),
* `CONNECT` (успостављање конекције),
* `OPTIONS` (листа подржаних метода),
* `TRACE` (провера путање) и
* `PATCH` (модификација ресурса).

Са овим захтевима упознаћеш се детаљније у каснијим лекцијама, а нарочито у
III и IV разреду у оквиру предмета Веб програмирање.

**HTTP захтев** састоји се из заглавља (енгл. *header*), празне линије и тела
захтева. У заглављу се описује захтев (тип: `GET` или `POST`, назив документа
HTML верзија, име хоста и други опциони елементи). На пример:

```text
GET /home.html HTTP/1.1
Host: developer.mozilla.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:50.0) Gecko/20100101 Firefox/50.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Referer: https://developer.mozilla.org/testpage.html
Connection: keep-alive
Upgrade-Insecure-Requests: 1
If-Modified-Since: Mon, 18 Jul 2016 02:36:04 GMT
If-None-Match: "c561c68d0ba92bbeb8b0fff2a9199f722e3a621a"
Cache-Control: max-age=0
```

**Одговор веб сервера** садржи статус захтева и заглавље. Статуси се могу грубо
поделити на:

* `1xx` (информације),
* `2xx` (успешнe),
* `3xx` (редирекцијe),
* `4xx` (грешкe на страни клијента) и
* `5xx` (грешкe на страни сервера).

Вероватно си се до сада сусрео са статусима *404 – страница није пронађена* и
*500 – интерна грешка на серверу*.

## Језици на вебу

Данас се у веб технологијама користи мноштво описних језика и програмских
језика, о којима ћеш учити много током средње школе, а у овој лекцији биће
поменути само основни.

**HTML** (HyperText Markup Language), језик за опис хипертекста, је језик којим
се одређује садржај и структура веб-странице. Није програмски језик, већ само
описни језик! Иако је писање HTML кода могуће у најобичнијем текст едитору као
што је Notepad, за ову намену боље је да користиш специјаловани кôд-едитор као
што је **Visual Studio Code**. HTML ће бити главна тема у следећем поглављу.

**CSS** (енгл. Cascading Style Sheets) је језик за стилизовање елемената
креираних у описном језику HTML. Није програмски, већ је описни језик! CSS кôд
могуће је писати у најобичнијем текст едитору, али ћеш то ипак радити у истом
специјалозваном кôд-едитору **Visual Studio Code**. CSS ће уз HTML такође бити
главна тема у следећем поглављу.

Интеракцију између корисника и веб странице могуће је контролисати у прегледачу
помоћу програмског језика **JavaScript** или скраћено **JS**. JavaScript јесте
програмски језик високог нивоа који се извршава у тренутку генерисања веб
странице у самом прегледачу. Да би се исправно извршавао у свим прегледачима,
стандадизован је ECMAScript стандардом. JS ће бити главна тема у другом
полугодишту.

Могуће је остварити и интеракцију између веб сервера и корисника помоћу
програмских језика који се извршавају на веб серверу. Тада се каже да се на веб
серверу хостује **веб апликација**, а не веб сајт. Веб апликације пишу се у
програмским језицима **C# (ASP.NET)**, **PHP** и др. Оне често приступају
**базама података** у којима се чувају подаци који се приказују на веб
страницама.

## Поделе веб сајтова на основу технологија

Веб сајтови се могу поделити на основу веб технологија на:

* **Статичке веб сајтове** који су креирани само помоћу описних језика HTML и
CSS. Њихов садржај се не мења динамички, исти је за све кориснике, све странице
су унапред дефинисане на серверу и не постоји обрада података на страни
сервера.
* **Динамичке веб сајтове**, који могу бити:
  
    1. **Клијентски** динамички сајтови (енгл. client-rendered), где сервер шаље
    основну HTML страницу и JavaScript кôд, а финални изглед странице се
    генерише (рендерује) у прегледачу.
    2. **Серверски** динамички сајтови (енгл *server-rendered*), где се сваки
    пут када корисник приступи страници, HTML садржај динамички генерише на
    серверу (често на основу података из базе података).
    3. **Комбиновани** динамички сајтови (енгл. *isomorphic* или *universal
    application*), где се иницијални HTML генерише на серверу ради бржег
    приказа, а финални изглед и интерактивност се "дограђују" у прегледачу
    JavaScript-ом.
