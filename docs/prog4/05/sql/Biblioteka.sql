-- =============================================
-- Biblioteka: baza, podaci, procedura i primeri poziva
-- =============================================
USE master;
GO

IF DB_ID('Biblioteka') IS NOT NULL
BEGIN
    ALTER DATABASE Biblioteka SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Biblioteka;
END
GO

CREATE DATABASE Biblioteka;
GO

USE Biblioteka;
GO

-- =============================================
-- Tabele (IDENTITY na tabelama sa jednostavnim kljucem)
-- =============================================
CREATE TABLE Citalac (
    CitalacID    INT IDENTITY(1,1) NOT NULL,
    MaticniBroj  CHAR(13)      NOT NULL,
    Ime          NVARCHAR(50)  NOT NULL,
    Prezime      NVARCHAR(50)  NOT NULL,
    Adresa       NVARCHAR(100) NULL,
    CONSTRAINT PK_Citalac PRIMARY KEY (CitalacID)
);

CREATE TABLE Knjiga (
    KnjigaID  INT IDENTITY(1,1) NOT NULL,
    UDK       NVARCHAR(30)  NULL,
    ISBN      NVARCHAR(20)  NULL,
    Naziv     NVARCHAR(150) NOT NULL,
    CONSTRAINT PK_Knjiga PRIMARY KEY (KnjigaID)
);

-- Primerak: slaba entitetska tabela, PrimerakID je redni broj primerka unutar knjige
CREATE TABLE Primerak (
    KnjigaID    INT NOT NULL,
    PrimerakID  INT NOT NULL,
    CONSTRAINT PK_Primerak PRIMARY KEY (KnjigaID, PrimerakID),
    CONSTRAINT FK_Primerak_Knjiga FOREIGN KEY (KnjigaID) REFERENCES Knjiga(KnjigaID)
);

CREATE TABLE Autor (
    AutorID       INT IDENTITY(1,1) NOT NULL,
    Ime           NVARCHAR(50)  NOT NULL,
    Prezime       NVARCHAR(50)  NOT NULL,
    DatumRodjenja DATE          NULL,
    Adresa        NVARCHAR(100) NULL,
    Zvanje        NVARCHAR(50)  NULL,
    CONSTRAINT PK_Autor PRIMARY KEY (AutorID)
);

CREATE TABLE Izdavac (
    IzdavacID      INT IDENTITY(1,1) NOT NULL,
    NazivIzdavaca  NVARCHAR(100) NOT NULL,
    Adresa         NVARCHAR(100) NULL,
    CONSTRAINT PK_Izdavac PRIMARY KEY (IzdavacID)
);

CREATE TABLE Napisali (
    AutorID   INT NOT NULL,
    KnjigaID  INT NOT NULL,
    CONSTRAINT PK_Napisali PRIMARY KEY (AutorID, KnjigaID),
    CONSTRAINT FK_Napisali_Autor  FOREIGN KEY (AutorID)  REFERENCES Autor(AutorID),
    CONSTRAINT FK_Napisali_Knjiga FOREIGN KEY (KnjigaID) REFERENCES Knjiga(KnjigaID)
);

CREATE TABLE Izdali (
    IzdavacID  INT NOT NULL,
    KnjigaID   INT NOT NULL,
    Godina     INT NULL,
    CONSTRAINT PK_Izdali PRIMARY KEY (IzdavacID, KnjigaID),
    CONSTRAINT FK_Izdali_Izdavac FOREIGN KEY (IzdavacID) REFERENCES Izdavac(IzdavacID),
    CONSTRAINT FK_Izdali_Knjiga  FOREIGN KEY (KnjigaID)  REFERENCES Knjiga(KnjigaID)
);

CREATE TABLE Na_Citanju (
    KnjigaID       INT  NOT NULL,
    CitalacID      INT  NOT NULL,
    DatumUzimanja  DATE NOT NULL,
    DatumVracanja  DATE NULL,
    CONSTRAINT PK_Na_Citanju PRIMARY KEY (KnjigaID, CitalacID, DatumUzimanja),
    CONSTRAINT FK_NaCitanju_Knjiga  FOREIGN KEY (KnjigaID)  REFERENCES Knjiga(KnjigaID),
    CONSTRAINT FK_NaCitanju_Citalac FOREIGN KEY (CitalacID) REFERENCES Citalac(CitalacID)
);
GO

-- =============================================
-- Podaci (IDENTITY_INSERT da veze ostanu tacne)
-- =============================================
SET IDENTITY_INSERT Citalac ON;
INSERT INTO Citalac (CitalacID, MaticniBroj, Ime, Prezime, Adresa) VALUES
(1, '1503990710011', N'Marko',  N'Jovanović', N'Knez Mihailova 12, Beograd'),
(2, '2208985715022', N'Ana',    N'Petrović',  N'Bulevar oslobođenja 45, Novi Sad'),
(3, '0905001730033', N'Nikola', N'Ilić',      N'Cara Dušana 8, Niš'),
(4, '1211995745044', N'Jelena', N'Stanković', N'Svetosavska 21, Kragujevac'),
(5, '3007988710055', N'Stefan', N'Marković',  N'Vojvode Stepe 77, Beograd'),
(6, '1401002725066', N'Milica', N'Đorđević',  N'Trg slobode 3, Subotica');
SET IDENTITY_INSERT Citalac OFF;

SET IDENTITY_INSERT Knjiga ON;
INSERT INTO Knjiga (KnjigaID, UDK, ISBN, Naziv) VALUES
(1, '821.163.41-31', '978-86-521-1001-1', N'Na Drini ćuprija'),
(2, '821.163.41-31', '978-86-521-1002-8', N'Prokleta avlija'),
(3, '821.163.41-31', '978-86-521-1003-5', N'Seobe'),
(4, '821.163.41-31', '978-86-521-1004-2', N'Hazarski rečnik'),
(5, '821.163.41-31', '978-86-521-1005-9', N'Derviš i smrt'),
(6, '821.163.41-1',  '978-86-521-1006-6', N'Gorski vijenac'),
(7, '821.163.41-31', '978-86-521-1007-3', N'Peščanik');
SET IDENTITY_INSERT Knjiga OFF;

INSERT INTO Primerak (KnjigaID, PrimerakID) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 2),
(3, 1),
(4, 1), (4, 2),
(5, 1),
(6, 1), (6, 2),
(7, 1);

SET IDENTITY_INSERT Autor ON;
INSERT INTO Autor (AutorID, Ime, Prezime, DatumRodjenja, Adresa, Zvanje) VALUES
(1, N'Ivo',     N'Andrić',    '1892-10-09', N'Beograd',  N'Nobelovac'),
(2, N'Miloš',   N'Crnjanski', '1893-10-26', N'Beograd',  N'Akademik'),
(3, N'Milorad', N'Pavić',     '1929-10-15', N'Beograd',  N'Profesor'),
(4, N'Meša',    N'Selimović', '1910-04-26', N'Tuzla',    N'Akademik'),
(5, N'Petar',   N'Njegoš',    '1813-11-13', N'Cetinje',  N'Vladika'),
(6, N'Danilo',  N'Kiš',       '1935-02-22', N'Subotica', N'Pisac');
SET IDENTITY_INSERT Autor OFF;

SET IDENTITY_INSERT Izdavac ON;
INSERT INTO Izdavac (IzdavacID, NazivIzdavaca, Adresa) VALUES
(1, N'Laguna',                   N'Resavska 33, Beograd'),
(2, N'Vulkan izdavaštvo',        N'Bulevar Mihajla Pupina 10, Beograd'),
(3, N'Prosveta',                 N'Dobrinjska 11, Beograd'),
(4, N'Srpska književna zadruga', N'Ulica Vuka Karadžića 2, Beograd'),
(5, N'Geopoetika',               N'Kralja Milutina 18, Beograd'),
(6, N'Službeni glasnik',         N'Jovana Ristića 1, Beograd');
SET IDENTITY_INSERT Izdavac OFF;

INSERT INTO Napisali (AutorID, KnjigaID) VALUES
(1, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7);

INSERT INTO Izdali (IzdavacID, KnjigaID, Godina) VALUES
(1, 1, 2018), (2, 2, 2015), (3, 3, 2012), (1, 4, 2019),
(4, 5, 2010), (6, 6, 2016), (5, 7, 2020);

INSERT INTO Na_Citanju (KnjigaID, CitalacID, DatumUzimanja, DatumVracanja) VALUES
(2, 1, '2025-03-10', '2025-03-30'),
(3, 1, '2025-05-12', '2025-06-01'),
(1, 2, '2025-11-04', '2025-11-20'),
(1, 1, '2026-09-05', '2026-09-26'),
(2, 2, '2026-09-12', '2026-10-03'),
(3, 3, '2026-10-01', '2026-10-20'),
(4, 4, '2026-10-10', NULL),
(5, 5, '2026-10-18', NULL),
(1, 6, '2026-10-25', NULL),
(7, 1, '2026-10-28', NULL);
GO

-- =============================================
-- Uskladistena procedura
-- akcija 0 = SELECT citalaca
-- akcija 1 = INSERT citaoca
-- akcija 2 = izvestaj o iznajmljivanju po godinama
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[usp_Citalac]
    @sifra       INT           = NULL,
    @ime         NVARCHAR(50)  = NULL,
    @prezime     NVARCHAR(50)  = NULL,
    @maticniBroj NVARCHAR(13)  = NULL,
    @adresa      NVARCHAR(100) = NULL,
    @akcija      INT           = NULL,
    @od          INT           = NULL,
    @do          INT           = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @akcija = 0
        SELECT * FROM Citalac AS c
        WHERE c.CitalacID = @sifra OR @sifra IS NULL;

    ELSE IF @akcija = 1
        INSERT INTO Citalac (Ime, Prezime, MaticniBroj, Adresa)
        VALUES (@ime, @prezime, @maticniBroj, @adresa);

    ELSE IF @akcija = 2
        SELECT C.Ime + ' ' + C.Prezime AS Citalac,
               YEAR(NC.DatumUzimanja)  AS Godina,
               COUNT(*)                AS BrojIznajmljivanja,
               COUNT(*) - COUNT(NC.DatumVracanja) AS NijeVraceno
        FROM Na_Citanju NC
        JOIN Citalac C ON NC.CitalacID = C.CitalacID
        WHERE (C.CitalacID = @sifra OR @sifra IS NULL)
          AND (@od IS NULL OR YEAR(NC.DatumUzimanja) >= @od)
          AND (@do IS NULL OR YEAR(NC.DatumUzimanja) <= @do)
        GROUP BY YEAR(NC.DatumUzimanja), C.Ime + ' ' + C.Prezime
        ORDER BY Citalac, Godina;
END
GO

