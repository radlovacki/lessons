# Припрема за контролни: Картица производа са компонентама

Задатак: Креирај картицу производа користећи Auto Layout и компоненте са варијантама.

## Постављање компоненти (Лекција 1 & 2)

Направи нови дизајн фајл и додај фрејм 1440×1024px са позадином #F5F5F5. На центар постави картицу 320×420px, бела позадина, corner radius 16px и drop shadow (Y:8, Blur:24, opacity 10%).

## Садржај картице (Лекција 2)

Картица треба да садржи:

Placeholder слику 320×180px (сива позадина #E0E0E0)
Назив производа 18px Bold, #1A1A1A
Опис производа 14px Regular, #666666
Цена 20px Bold, #1A1A1A
Дугме "Додај у корпу"

## Auto Layout (Лекција 3)

Цена и дугме морају бити у хоризонталном Auto Layout frame-у, са Space between alignment-ом.

Цео текстуални садржај (назив, опис, footer) мора бити у вертикалном Auto Layout-у: gap 10px и padding 20px.

Провери да картица мења висину ако промениш текст назива.

## Компонента са варијантама (Лекција 4)

Дугме "Додај у корпу" мора бити Component Set са следећим варијантама:

| Variant | Fill | Text color | Stroke |
| ------- | ---- | ---------- | ------ |
| Primary | #4A90E2 | #FFFFFF | — |
| Outline | #FFFFFF | #4A90E2 | 2px #4A90E2 |
| Danger | #E74C3C | #FFFFFF | — |

Постави 3 инстанце картице, где свака има различиту варијанту дугмета.

## РЕШЕЊЕ ЗАДАТКА

### Корак 1: Постављање фајла и фрејма

1. Пријави се у [www.figma.com](https://www.figma.com) и кликни на **New design file**
2. Преименуј фајл у "Kartica Proizvoda"
3. Притисни **F** (Frame tool)
4. У десном панелу изабери **Desktop (1440 × 1024)** или ручно унеси димензије
5. Преименуј фрејм у "Desktop"
6. У Design панелу постави **Fill** на `#F5F5F5`

### Корак 2: Креирање картице

1. Притисни **R** (Rectangle)
2. Нацртај правоугаоник **320 × 420px**
3. Центрирај га на фрејм: **X: 560, Y: 302** (или селектуј картицу + фрејм па притисни иконе за центрирање)
4. Преименуј слој у "Product Card"
5. У Design панелу подеси:
   - **Fill:** `#FFFFFF`
   - **Corner radius:** `16px`
   - **Drop shadow:** X: 0, Y: 8, Blur: 24, Spread: 0, боја `#000000`, opacity `10%`

### Корак 3: Placeholder слика

1. Притисни **R** (Rectangle)
2. Нацртај правоугаоник **320 × 180px**
3. Позиционирај на врх картице: **X: 560, Y: 302**
4. Преименуј у "Image Placeholder"
5. Подеси **Fill:** `#E0E0E0`
6. Притисни **T** (Text), напиши "320×200" и центрирај унутар слике
   - Font size: 14px, Color: `#999999`

### Корак 4: Текстуални садржај

#### Назив производа

1. Притисни **T**, напиши нпр. "Бежичне слушалице"
2. Подеси: Font size `18px`, Weight **Bold**, Color `#1A1A1A`
3. Преименуј слој у "Title"

#### Опис производа

1. Притисни **T**, напиши нпр. "Висок квалитет звука, до 30h трајање батерије."
2. Подеси: Font size `14px`, Weight Regular, Color `#666666`
3. Преименуј слој у "Description"

#### Цена

1. Притисни **T**, напиши "RSD 5000"
2. Подеси: Font size `20px`, Weight **Bold**, Color `#1A1A1A`
3. Преименуј слој у "Price"

### Корак 5: Креирање дугмета (Main Component)

1. Притисни **T**, напиши "Додај у корпу"
2. Подеси: Font size `14px`, Weight **Semi-Bold**, Color `#FFFFFF`
3. Селектуј текст → притисни **Shift + A** (Auto Layout)
4. Подеси padding:
   - Хоризонтални: `16px`
   - Вертикални: `10px`
5. Подеси: Fill `#4A90E2`, Corner radius `8px`
6. Преименуј у "Button/Primary"
7. Направи компоненту: **Ctrl + Alt + K**
   - Видиш љубичасти оквир = Main Component ✅

### Корак 6: Варијанте дугмета

#### Outline варијанта

1. Копирај Main Component (**Ctrl + C, Ctrl + V**)
2. Промени:
   - **Fill:** `#FFFFFF`
   - **Stroke:** 2px, боја `#4A90E2`
   - **Text color:** `#4A90E2`

#### Danger варијанта

1. Копирај Main Component поново
2. Промени:
   - **Fill:** `#E74C3C`
   - **Text color:** `#FFFFFF`

#### Комбинуј у Component Set

1. Селектуј сва 3 дугмета (Shift + клик)
2. Десни клик → **"Combine as variants"**
3. Преименуј Property:
   - Кликни на "Property 1" → преименуј у **"Variant"**
   - Преименуј вредности у: **Primary**, **Outline**, **Danger**

### Корак 7: Footer (Auto Layout — хоризонтални)

1. Селектуј **"Price"** и инстанцу дугмета (Shift + клик)
2. Притисни **Shift + A** (Auto Layout)
3. У Design панелу подеси:
   - **Direction:** Horizontal (→)
   - **Alignment:** Space between
   - **Padding:** 0
4. Преименуј у "Footer"
5. Подеси ширину на **280px** (Fixed)

### Корак 8: Content (Auto Layout — вертикални)

1. Селектуј **"Title"**, **"Description"** и **"Footer"** (Shift + клик)
2. Притисни **Shift + A**
3. У Design панелу подеси:
   - **Direction:** Vertical (↓)
   - **Gap:** `10px`
   - **Padding:** `20px` (са свих страна)
   - **Fill:** `#FFFFFF`
4. Преименуј у "Content"
5. Подеси ширину на **320px** (Fixed)

### Корак 9: Card (Auto Layout — вертикални)

1. Селектуј **"Image Placeholder"** и **"Content"** (Shift + клик)
2. Притисни **Shift + A**
3. У Design панелу подеси:
   - **Direction:** Vertical (↓)
   - **Gap:** `0`
   - **Padding:** `0`
   - **Fill:** `#FFFFFF`
   - **Corner radius:** `16px`
   - **Drop shadow:** X: 0, Y: 4, Blur: 12, боја `#000000`, opacity `8%`
4. Преименуј у "Product Card"
5. Подеси ширину на **320px** (Fixed)

### Корак 10: 3 инстанце картице

1. Селектуј "Product Card"
2. Дуплирај 2 пута (**Ctrl + D**)
3. Поставе 3 картице у ред са размаком 32px
4. На свакој картици:
   - Уђи у дугме (double-click)
   - У Design панелу нађи dropdown **"Variant"**
   - Прва картица: **Primary**
   - Друга картица: **Outline**
   - Трећа картица: **Danger**

## Финална структура слојева

```text
Desktop (Frame 1440×1024)
├── Product Card (Auto Layout - vertical)
│   ├── Image Placeholder
│   └── Content (Auto Layout - vertical)
│       ├── Title
│       ├── Description
│       └── Footer (Auto Layout - horizontal)
│           ├── Price
│           └── Button/Primary (Instance)
├── Product Card (копија — Outline)
└── Product Card (копија — Danger)
```
