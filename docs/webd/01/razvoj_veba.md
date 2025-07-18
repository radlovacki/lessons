# Развој веба и основни појмови

## Развој Интернета

ARPANET (енгл. *Advanced Research Projects Agency Network*), рачунарска мрежа
америчког министарства одбране почела је са радом 29. октобра 1969. године.
Била је заснована на мрежном протоколу NCP (енгл. *Network Control Protocol*).
Седамдесетих година проширила се Северном Америком и Европом.

Јануара 1983. године NCP је замењен TCP/IP скупом протокола, а септембра 1984.
године ARPANET је подељен на војни и цивилни део мреже. Војни део мреже је
престао са радом почетком деведесетих година, а цивилни део постао је NSFNET
(енгл. *National Science Foundation Network*). NSFNET-у касније су се
придружиле и друге истраживачке и комерцијалне мреже, па је тај **скуп свих
повезаних мрежа** касније добио име Интернет (скраћено од *internetworking*).

Стандардизовати комуникацију између рачунара различитих произвођача, који имају
различиту мрежну опрему, на којима раде различити оперативни системи, у којима
се извршавају различите апликације је прилично сложен задатак. Овај задатак
решен је раздвајањем проблема у целине које се називају **слојеви**. Спајањем
слојева у једну целину добија се концептуална скица која дефинише како
комуникација треба да се одвија и на основу које се развијају мрежни протоколи.
Захваљујући слојевитој архитектури мрежних протокола различити системи могли су
да имплементирају TCP/IP скуп протокола и самим тим постану део Интернета. Више
о овоме учићеш у оквиру предмета *Рачунарске мреже и интернет сервиси* у трећем
разреду.

Деведесетих година почели су са радом и комерцијални Интернет сервис добављачи
(енгл. *ISP – Internet Service Providers*), који су корисницима омогућавали
приступ интернету путем јавне телефонске мреже. У почетку, корисницима
интернета били су доступни сервиси електронске поште, сервиса за размену
датотека и сервиса за даљинско управљање.

## Развој веба

Веб (енгл. *www - World Wide Web*) је изумео енглески програмер Тим Бернерс-Ли
(енгл. *Tim Berners-Lee*) у Швајцарској у Европској организацији за атомска
истраживања CERN.

![Тим Бернерс-Ли](./images/tim-berners-lee.jpg)

Пројекат је започет 1989. године са циљем да олакша размену информација међу
научницима коришћењем хипертекст система. Пројекат је представљен 1990. године
у виду два програма:

* **веб-прегледача** WorldWideWeb, касније преименованог у Nexus и
* **веб-сервера** CERN httpd.

![NeXT рачунар са првим веб сервером](./images/first_web_server.jpg)

**Веб** је у свом најједноставнијем облику систем међусобно повезаних
хипертекстуалних докумената који се налазе на интернету. **Хипертекстуални
документ** је текстуална датотека формирана **језиком за опис хипертекста**
(енгл. *HTML – HyperText Markup Language*). Садржај хипертекстуалног документа
корисници могу да виде уз помоћ програма који се назива **веб-прегледач**
(енгл. *Web Browser*).

**Веб-страница** је појединачни хипертекстуални документ на вебу који може да
садржи текст, линкове, слике и друге дигиталне садржаје. Свака веб страница
може да се идентификује помоћу јединствене адресе која се назива URL (енгл.
*Uniform Resource Locator*).

**Веб-сајт** представља скуп повезаних веб страница које чине целину и налазе
се на истом домену. Све странице једног сајта најчешће имају сличан изглед и
међусобно су повезане менијима и линковима.

Веб-странице заједно са пратећим садржајима веб-прегледачу испоручује
**веб-сервер** (енгл. *Web Server*) путем **протокола за пренос хипертекста**
(енгл. *HTTP – Hypertext Transfer Protocol*) или данас чешће, путем безбедног
протокола за пренос хипертекста (енгл. *HTTPS – Hypertext Transfer Protocol
Secure*).

Како је веб растао, јавила се потреба за интерактивним и прилагодљивим
веб страницама. Увођењем програмских језика, као што су JavaScript на страни
клијента и PHP и ASP на страни сервера, омогућено је да се садржај веб странице
генерише, односно мења у складу са акцијама корисника. Ово је био почетак
динамичког веба популарно названог веб 2.0. Веб сајтови више нису били само
скупови докумената, већ су прерасли у интерактивне веб апликације.
**Веб-апликација** је апликација којој корисник приступа путем веб-прегледача.

Веб је имао, а и даље има, централну улогу у развоју информационог друштва и
примарни је алат који милијарде људи употребљава свакодневно на интернету. У
свом основном облику веб није имао много могућности за интеракцију – био је
само велика база информација са примитивним техникама за индексирање и
претраживање. Развојем програмских језика за веб програмирање, дошло је до
развоја веб апликација.

Веб апликације постале су незаобилазни део свакодневног приватног и пословног
живота људи. Користе се: за електронску пошту; за комуникацију порукама, гласом
или видеом; за имплементацију друштвених мрежа, портала, форума и веб сајтова;
за електронско и банкарско пословање; за пословање у организацијама,
администрацију и канцеларијске послове; за имплементацију сервиса јавне управе
итд. Тешко би било пронаћи неку људску делатност за коју не постоји веб
апликација, а још теже навести све делатности у којима се користе веб
апликације.

??? question "Заокружите тачне исказе. Интернет је:"

    1. **Интернет је светски систем умрежених рачунарских мрежа**
    2. Софтвер за преглед и приказ www страница се сматра Интернетом
    3. Подаци који „путују“ светском мрежом и скуп корисника заједно чине
    Интернет мрежу
    4. **Интернет чини њена хардверска компонента као и систем софтверских
    слојева који контролишу различите аспекте њене комуникационе
    инфраструктуре**
    
    (Питање 175. из Приручника за полагање матурског испита)
