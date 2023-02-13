

ALTER TABLE Leagues
ADD CONSTRAINT uq_LeaguePrize UNIQUE (LPrize);

ALTER TABLE Owners
ADD ZipCode INT;


DROP INDEX idx_ncl_prize ON Leagues

-- clustered index scan;

SELECT * 
FROM Leagues
WHERE LDifficulty='hard'

-- clustered index seek;

SELECT LName,LPrize
FROM Leagues
WHERE lid=2

-- nonclustered index scan


CREATE NONCLUSTERED INDEX  idx_ncl_prize
ON Leagues(LPrize)
INCLUDE (LDifficulty)

SELECT LDifficulty,LPrize
FROM Leagues
WHERE LDifficulty='hard'


EXECUTE sp_helpindex Owners
EXECUTE sp_helpindex Leagues
--nonclustered index seek

SELECT LPrize
FROM Leagues
WHERE LPrize=55000


--key lookup

SELECT LName
FROM Leagues
WHERE LPrize=70000


--b)


CREATE NONCLUSTERED INDEX  idx_ncl_zipcode
ON Owners(ZipCode)
INCLUDE (oName,oDob)


SELECT *
FROM Owners
WHERE ZipCode>5

SELECT oName,oDob,ZipCode
FROM Owners
WHERE ZipCode=5


--c)

ALTER VIEW TeamLeagues AS
SELECT T.tName,L.LName,L.LDifficulty,L.LPrize
FROM Teams T INNER JOIN Leagues L on T.lid=L.lid
WHERE L.LPrize=50000

EXECUTE sp_helpindex Leagues
EXECUTE sp_helpindex Teams

SELECT * 
FROM TeamLeagues

DROP INDEX idx_ncl_prize on Leagues

SELECT * FROM Teams
SELECT * FROM Owners
SELECT * FROM Leagues

