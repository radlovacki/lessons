# Задатак за блок наставу из ПИТ (Програмирање)

Креирај `.csv` фајл са најмање 5 колона, на пример `Ime`, `Prezime`, `Pol`, `Razred`, `Odeljenje` и `Prosek`:

```csv
Pera,Perić,M,I,2,4.33
Paja,Pajić,M,II,2,4.5
Ana,Anić,Z,III,1,4.67
Mitar,Mitrović,M,III,2,4.13
Jovan,Jovanić,M,III,2,5.0
```

Креирај Windows Forms App (.NET Framework). На главну форму постави контроле за
унос и приказ података, на пример:

* `TextBox` за унос имена,
* `TextBox` за унос презимена,
* 2 x `RadioButton` за одабир пола,
* `ComboBox` за одабир понуђених разреда,
* `ComboBox` за одабир понуђених одељења,
* `TextBox` за унос просечне оцене и
* `ListView` за приказ свих података.

Креирај класу са неопходним пољима, на пример:

* `public string Ime { get; set; }`
* `public string Prezime { get; set; }`
* `public string Pol { get; set; }`
* `public string Razred { get; set; }`
* `public int Odeljenje { get; set; }`
* `public double Prosek { get; set; }`

...са адекватним контруктором, на пример:

```cs
public Ucenik(string ime, string prezime, string pol, string razred, int odeljenje, double prosek)
{
    Ime = ime;
    Prezime = prezime;
    Pol = pol;
    Razred = razred;
    Odeljenje = odeljenje;
    Prosek = prosek;
}
```

...и са методама за уписивање података у фајл и читање података из фајла.

У класи `Form1` имплементирај методе за:

* УНОС ПОДАТАКА,
* ИЗМЕНУ ПОДАТАКА,
* БРИСАЊЕ ПОДАТАКА,
* ЧУВАЊЕ СВИХ ПОДАТАКА У ФАЈЛ и
* УЧИТАВАЊЕ ПОДАТАКА ИЗ ФАЈЛА.

Такође, имплементирај макар једну методу ЗА ОБРАДУ ПОДАТАКА, (нпр. за приказ
просечне оцене свих ученика која ће се приказати у контроли `MessageBox`).

Све имплементиране методе можеш да позиваш кликом на одговарајуће дугме.

На самој форми постави контролу `Label` у којој ће својство текст бити твоје Презиме, Име, Разред и Одељење (нпр. Radlovački Velimir, III2).

Цео пројекат постави на свој GitHub у репозиторијум `Prog3-BlokNastava`.
У `README.md` напиши кратак опис свог пројекта:

* назив пројекта
* одакле си преузео скуп података за обуку модела
* како си креирао и употребио модел машинског учења

На пример, довољно је пројекат описати овако:

```text
# Пројекат из програмирања III

Софтвер за вођење евиденције ученика.
```
