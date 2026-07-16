# Препознавање SPAM SMS-а

## Увод

У овој лекцији научићеш да направиш десктоп апликацију у C# / Windows Forms
која користи модел машинског учења за препознавање SPAM SMS порука. Апликација
ће анализирати текст поруке и проценити да ли је у питању нежељена (SPAM) или
легитимна (HAM) порука.

### Машинско учење и класификација

Машинско учење (Machine Learning — ML) је грана вештачке интелигенције у којој
рачунар учи из података уместо да буде програмиран тачним правилима. Уместо да
пишеш услове типа "ако порука садржи реч бесплатно" — то је SPAM", показујеш
моделу хиљаде примера и он самостално проналази обрасце. У овом случају користи
се бинарна класификација: за сваку поруку модел одлучује да ли је:

* HAM — легитимна порука, или
* SPAM — нежељена/рекламна порука.

### ML.NET и Model Builder

ML.NET је Мајкрософтов отворени фрејмворк за машинско учење намењен .NET
апликацијама. ML.NET Model Builder је визуелни додатак за Visual Studio који
аутоматизује процес тренирања — не мораш да познајеш математику иза модела да
би га употребио у пракси.

## Скуп података (Dataset)

Модел машинског учења учи из скупа означених примера. Наш скуп података
(фајл `spam.txt`) садржи SMS поруке означене са ham (легитимне) или spam.

[Преузми датасет](spam.txt)

Датотека `spam.txt` је текстуална датотека са две колоне одвојене табулатором:

```text
Col0   Col1
ham    Go until jurong point, crazy..
ham    Ok lar... Joking wif u oni...
spam   Free entry in 2 a wkly comp to win FA Cup final tkts
spam   WINNER!! As a valued network customer you have been selected...
ham    I'm gonna be home soon and i don't want to talk about this stuff anymore...
```

Прва колона (Col0) садржи ознаку (ham / spam), а друга (Col1) текст поруке.

### Статистика скупа података

| Категорија | Број порука | Удео |
| -- | -- | -- |
| HAM (легитимне) | ~4.827 | ~86,6% |
| SPAM (нежељене) | ~747 | ~13,4% |
| УКУПНО | ~5.574 | 100% |

## Visual Studio пројекат

1. **Покрени Visual Studio 2022**. Изабери Create a new project на почетном екрану.
2. **Одабери шаблон пројекта**. У пољу за претрагу унеси Windows Forms и изабери Windows Forms App (.NET) — ВАЖНО: не бирај .NET Framework верзију.
3. **Конфигурише пројекат**. Унеси назив пројекта нпр. SpamDetektor, локацију на диску, и потврди. Фрејмворк остави на .NET 8.0 или новији.
4. **Додај датотеку са подацима**. Копирај spam.txt у главни директоријум пројекта (исти ниво са .csproj датотеком).

## Тренирање модела — ML.NET Model Builder

ML.NET Model Builder је алат у оквиру Visual Studio-а који аутоматски тренира
модел и генерише C# код.

1. **Покретање Model Builder-а**. Десни клик на пројекат у Solution Explorer
→ Add → Machine Learning Model - назови га `Spam.mbconfig` Отвара се чаробњак
ML.NET Model Builder у десном панелу Visual Studio-а. Кликни Next да прећеш
на следећи корак.
2. **Избор сценарија**. У чаробњаку бираш задатак машинског учења:
Изабери Data Classification. Кликни Next да прећеш на следећи корак.
3. **Избор окружења за тренирање**. Model Builder нуди два окружења:
Local (CPU/GPU) — тренирање на твом рачунару и Azure — тренирање у облаку
За ову лекцију и овај свенарио изабери Local и кликни Next.
4. **Учитавање података**. Извор података: изабери File и потом кликни Browse
да потражиш spam.txt у директоријуму пројекта. Подешавање колона: Model Builder
ће аутоматски детектовати колоне раздвојене табулатором. Провери да је Col0 постављено као Label (шта треба да се предвиди).
5. **Верификација**. У прегледу података провери да су подаци исправно учитани —
требало би да видиш колоне Col0 и Col1 са вредностима ham/spam и текстовима порука.
Кликни Next да прећеш на тренирање.
6. **Тренирање модела**. Подеси Time to train — препорука је минимум 60 секунди за
добре резултате (можеш поставити и 120 секунди). Кликни Start Training и сачекај да
се тренирање заврши. Model Builder аутоматски испробава више различитих алгоритама
(нпр. FastTree, SdcaMaximumEntropy и др.) и бира онај са највишим тачности
(accuracy) на тест скупу података.
7. **Резултати тренирања**. Након тренирања, Model Builder приказује метрике
квалитета модела.
8. **Евалуација и кодирање**. У делу Evaulate можеш да "пробаш" како генерисани
модел ради, а у делу Consume можеш да видиш пример кода за коришћење генерисаног
модела.

## Дизајн корисничког интерфејса

Отвори Form1.cs у дизајнеру и постави следеће компоненте:

* Label label1 "Унеси поруку:"
* TextBox txtPoruka
* Button btnPredvidi "Предвиди"

Двоструким кликом на дугме btnPredvidi у дизајнеру, генерише се метода клика
на дугме коју треба да дефинишеш овако:

```cs
private void btnPredvidi_Click(object sender, EventArgs e)
{
    if (txtPoruka.Text != string.Empty)
    {
        string poruka = txtPoruka.Text;

        // Kreiranje ulaznog objekta za model
        var unos = new Spam.ModelInput()
        {
            Col1 = poruka
        };

        // Pozivanje modela - rezultat predikcije
        var rezultat = Spam.Predict(unos);

        // Prikaz rezultata
        MessageBox.Show(
            $"Poruka: {poruka}\n" +
            $"Predviđanje: {rezultat.PredictedLabel}\n" +
            $"Jeste SPAM: {rezultat.Score[1]:P2}\n" +
            $"Nije SPAM:  {rezultat.Score[0]:P2}",
            "Rezultat analize",
            MessageBoxButtons.OK,
            rezultat.PredictedLabel == "spam"
                ? MessageBoxIcon.Warning
                : MessageBoxIcon.Information
        );
    }
    else
    {
        MessageBox.Show(
            "Unesite tekst poruke!",
            "Upozorenje",
            MessageBoxButtons.OK,
            MessageBoxIcon.Warning
        );
    }
}
```
