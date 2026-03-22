# .NET DES класа

Представља основну класу за Data Encryption Standard (DES) алгоритам из које
се изводе све DES имплементације.

## Шифровање и дешифровање стринга

```cs
using System.Security.Cryptography;
using System.Text;

class Program
{
    static string Sifruj(string otvoreniTekst, string kljuc, string iv)
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

    static string Desifruj(string sifrat, string kljuc, string iv)
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

    static void Main()
    {
        string otvoreniTekst = "Ovo je tajna poruka!";
        string kljuc = "12345678";
        string iv = "abcdefgh";
        Console.WriteLine($"Originalna poruka: {otvoreniTekst}");
        string sifrat = Sifruj(otvoreniTekst, kljuc, iv);
        Console.WriteLine($"Sifrovana poruka: {sifrat}");
        string desifrovaniTekst = Desifruj(sifrat, kljuc, iv);
        Console.WriteLine($"Desifrovana poruka: {desifrovaniTekst}");
    }
}
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
бинарне податке претвориш у безбедан низ од 64 карактера који се лако преносе
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
