-- -----------------------------------------------------------------------------
--             G�n�ration d'une base de donn�es pour
--                      Oracle Version 10g
--                        (8/4/2014 16:30:47)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLR3
--      Projet : Course � pied
--      Auteur : etudiant etudiant
--      Date de derni�re modification : 8/4/2014 16:30:04
-- -----------------------------------------------------------------------------

DROP TABLE COURSE CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       TABLE : COURSE
-- -----------------------------------------------------------------------------


CREATE TABLE COURSE
(
    NUMCOURSE NUMBER(3)  NOT NULL,
    LIBCOURSE VARCHAR(20)  NOT NULL,
    VILLECOURSE VARCHAR(45)  NOT NULL,
    DATECOURSE DATE  NOT NULL,
	CONSTRAINT PK_COURSE PRIMARY KEY (NUMCOURSE)  
);