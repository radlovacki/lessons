# Рад са стринговима

Нека је задатак да напишеш програм који шифрује и дешифрује задати стринг
користећи DES алгоритам. Програм мора да користи .NET класу DES и да садржи
методе за шифровање и дешифровање. У главном делу програма треба да се унесу
отворени текст, кључ и вектор за иницијализацију, па затим да се у
конзоли испише шифрат и дешифрован отворени текст.

```cs
using System.Security.Cryptography;
using System.Text;

string Sifruj(string otvoreniTekst, string kljuc, string iv)
{
    using (DES des = DES.Create())
    {
        des.Key = Encoding.UTF8.GetBytes(kljuc);
        des.IV = Encoding.UTF8.GetBytes(iv);
        byte[] originalniBajtovi = Encoding.UTF8.GetBytes(otvoreniTekst);
        ICryptoTransform sifrator = des.CreateEncryptor();
        byte[] sifrovaniBajtovi = sifrator.TransformFinalBlock(originalniBajtovi, 0, originalniBajtovi.Length);
        return Convert.ToBase64String(sifrovaniBajtovi);
    }
}

string Desifruj(string sifrat, string kljuc, string iv)
{
    using (DES des = DES.Create())
    {
        des.Key = Encoding.UTF8.GetBytes(kljuc);
        des.IV = Encoding.UTF8.GetBytes(iv);
        byte[] sifrovaniBajtovi = Convert.FromBase64String(sifrat);
        ICryptoTransform desifrator = des.CreateDecryptor();
        byte[] originalniBajtovi = desifrator.TransformFinalBlock(sifrovaniBajtovi, 0, sifrovaniBajtovi.Length);
        return Encoding.UTF8.GetString(originalniBajtovi);
    }
}

Console.Write("Unesi poruku: ");
string otvoreniTekst = Console.ReadLine() ?? string.Empty;
Console.Write("Unesi kljuc: ");
string kljuc = Console.ReadLine() ?? string.Empty;
Console.Write("Unesi vektor: ");
string iv = Console.ReadLine() ?? string.Empty;
if (if (Encoding.UTF8.GetByteCount(kljuc) != 8 || Encoding.UTF8.GetByteCount(iv) != 8))
{
    Console.WriteLine("Greska! Kljuc i vektor moraju imati tacno 8 karaktera!");
    return;
}
string sifrat = Sifruj(otvoreniTekst, kljuc, iv);
Console.WriteLine($"Sifrovana poruka: {sifrat}");
string desifrovaniTekst = Desifruj(sifrat, kljuc, iv);
Console.WriteLine($"Desifrovana poruka: {desifrovaniTekst}");
```

## Како функционише овај програм?

Метода `Sifruj()` прима три параметра: отворени текст, кључ и вектор за
иницијализацију. `DES.Create()` креира DES објекат који обавља шифровање.
Креираном објекту додељује се кључ и вектор за иницијализацију који морају да
буду дугачки тачно осам бајтова. Отворени текст се такође конвертује у бајтове.
`CreateEncryptor()` креира шифратор који методом `TransformFinalBlock()`
бајтове отвореног текста претвара у бајтове шифрата. На крају, метода
`Sifruj()` враћа Base64 стринг који је настао конвертовањем бајтова шифрата.

Метода `Desifruj()` ради обрнутим редоследом. Она такође прима три параметра,
где је први шифрат. Креираном DES објекту додељују се бајтови кључа и вектора
за иницијализацију и шифрат се конвертује у бајтове. `CreateDecryptor()` креира
дешифратор који методом `TransformFinalBlock()` бајтове шифрата претвара у
бајтове отвореног текста. На крају, метода `Desifruj()` враћа отворени текст у
виду UTF8 стринга.

Зашто и метода `Sifruj()` не врати UTF8 стринг, већ је потребно конвертовати
шифрат у Base64 стринг? Ако би покушао да бајтове шифрата претвориш директно у
стринг помоћу `Encoding.UTF8.GetString()`, добио би много нечитљивих симбола,
па би приликом преноса кроз мрежу или записа у базу података неки бајтови могли
бити изгубљени или погрешно интерпретирани. Base64 је начин да било које
бинарне податке претворишу у низ карактера из скупа од 64 дозвољена карактера
(слова `A`-`Z`, `a`-`z`, цифре `0`-`9` и знаци `+` и `/`). Дакле, Base64 је
у овом случају неопходан, како би безбедно користио бинарни шифрат. Кратак
приказ тока података у овом програму изгледао би овако:

Процес шифровања:

* Отворени текст **⎯(Encoding.UTF8)→** Бајтови (читљиви)
* Бајтови **⎯(DES)→** Шифровани бајтови (бинарни хаос)
* Шифровани бајтови **⎯(Convert.ToBase64String)→** Шифровани стринг (безбедан)

Процес дешифровања:

* Шифровани стринг **⎯(Convert.FromBase64)→** Шифровани бајтови (бинарни хаос)
* Шифровани бајтови **⎯(DES)→** Бајтови (читљиви)
* Бајтови **⎯(Encoding.UTF8)→** Отворени текст

## Хватање изузетака

Методе `Sifruj()` и `Desifruj()` у решењу задатка могу да изазову изузетке
`CryptographicException` и `FormatException`. `CryptographicException` се јавља
нпр. када кључ садржи карактере чији UTF8 бајтови не одговарају DES захтевима,
а `FormatException` када `Convert.FromBase64String()` добије неисправан стринг.
Унутар самих метода `Sifruj()` и `Desifruj()` нема потребе за хватањем
изузетака јер се они могу хватати и у главном делу програма.

```cs
try
{
    string sifrat = Sifruj(otvoreniTekst, kljuc, iv);
    Console.WriteLine($"Sifrovana poruka: {sifrat}");
    string desifrovaniTekst = Desifruj(sifrat, kljuc, iv);
    Console.WriteLine($"Desifrovana poruka: {desifrovaniTekst}");
}
catch (CryptographicException e)
{
    Console.WriteLine($"Greska prilikom sifrovanja/desifrovanja: {e.Message}");
}
catch (FormatException e)
{
    Console.WriteLine($"Greska! Neispravan format sifrata: {e.Message}");
}
```

Сасвим је у реду да користиш `TransformFinalBlock()` приликом шифровања кратних
стрингова или када су подаци већ у меморији као `byte[]`. Међутим, треба
напоменути да се приликом коришћења `TransformFinalBlock()` све одједном
учитава у меморију! Проблем може да настане када је садржај превелик, нпр.
приликом шифровања и дешифровања фајлова, рада са мрежним стримовима, када
се унапред не може претпоставити величина података и сл. У том случају треба
користити `CryptoStream` што и јесте стандардно приликом употребе
криптографских .NET класа, а што ћеш научити у следећој лекцији.
