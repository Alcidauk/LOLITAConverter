-- PROCEDURES CONCERNANT LA TABLE CATEGORIE

--1 Affichage des données

--1.1 Affichage de toutes les données de la table
CREATE OR REPLACE
PROCEDURE afft_categorie
IS
	rep_css varchar2(255) := https://dl.dropboxusercontent.com/u/21548623/bootstrap.min.css;
	CURSOR lst
	IS 
	SELECT 
		 *
	FROM 
		CATEGORIE;
BEGIN
	htp.print('<!DOCTYPE html>');
	htp.htmlOpen;
	htp.headOpen;
	htp.title('Affichage table categorie');
	htp.print('<link href="' || rep_css || '" rel="stylesheet" type="text/css" />');
	htp.headClose;
	htp.bodyOpen;
	htp.print('<div class="container">');
	htp.header(1, 'LOLITA');
	htp.hr;
	htp.header(2, 'Liste categorie');
	htp.print('<table class="table">');
	htp.tableRowOpen(cattributes => 'class=active');
	htp.tableHeader('Numéro');
	htp.tableRowClose;
	FOR rec IN lst LOOP
	htp.tableRowOpen;
	htp.tableData(rec.numcategorie);
	htp.tableData(rec.libcategorie);
	htp.tableData(
		htf.anchor('ui_frmedit_categorie?vnumcategorie=' || rec.numcategorie, 'Modifier')
		|| ' ou ' ||
		htf.anchor('ui_execdel_categorie?vnumcategorie=' || rec.numcategorie, 'Supprimer')
	);
	htp.tableRowClose;
	END LOOP;
	htp.tableClose;
	htp.print('</div>');
	htp.bodyClose;
	htp.htmlClose;
END;
/


--2 Insertion

--2.1.2 Page de validation d'insertion, avec gestion des erreurs
-------Appel à la requête pa_add_categorie
CREATE OR REPLACE PROCEDURE ui_execadd_categorie
	(
		vnumcategorie in number,
		vlibcategorie in varchar2
	)

IS
	rep_css varchar2(255) := https://dl.dropboxusercontent.com/u/21548623/bootstrap.min.css;
BEGIN
	htp.print('<!DOCTYPE html>');
	htp.htmlOpen;
	htp.headOpen;
	htp.title('Insertion categorie');
	htp.print('<link href="' || rep_css || '" rel="stylesheet" type="text/css" />');
	htp.headClose;
	htp.bodyOpen;
	htp.print('<div class="container">');
	pa_add_categorie(vnumcategorie,vlibcategorie);
	htp.header(1, 'LOLITA');
	htp.hr;
	htp.header(2, 'Ajout effectue dans la table categorie');
	htp.print('<a class="btn btn-primary" href="afft_categorie" >Voir la liste complete</a>');
	htp.print('</div>');
	htp.bodyClose;
	htp.htmlClose;
EXCEPTION
	WHEN OTHERS THEN
		htp.print('ERROR: ' || SQLCODE);
END;
/


--2.1.1 Requête SQL
CREATE OR REPLACE PROCEDURE pa_add_categorie
	(
		vnumcategorie in number,
		vlibcategorie in varchar2
	)
IS
BEGIN
	INSERT INTO categorie VALUES
	(
		vnumcategorie,
		vlibcategorie
	);
COMMIT;
END;
/


--2.1.3 Formulaire d'insertion
------- Validation redirige vers ui_execadd_categorie
CREATE OR REPLACE PROCEDURE ui_frmadd_categorie
IS
	rep_css varchar2(255) := https://dl.dropboxusercontent.com/u/21548623/bootstrap.min.css;
BEGIN
	htp.print('<!DOCTYPE html>');
	htp.htmlOpen;
	htp.headOpen;
	htp.title('Insertion categorie');
	htp.print('<link href="' || rep_css || '" rel="stylesheet" type="text/css" />');
	htp.headClose;
	htp.bodyOpen;
	htp.print('<div class="container">');
	htp.header(1, 'Ajout élément dans la table categorie');
	htp.formOpen(owa_util.get_owa_service_path || 'ui_execadd_categorie', 'POST');
	htp.print('<table class="table">');
	htp.tableRowOpen;
	htp.tableData('vnumcategorie');
	htp.tableData(htf.formText('vnumcategorie', 4));
	htp.tableRowClose;
	htp.tableRowOpen;
	htp.tableData('vlibcategorie');
	htp.tableData(htf.formText('vlibcategorie', 50));
	htp.tableRowClose;
	htp.tableClose;
	htp.print('<button class="btn btn-primary" type="submit">Validation</button>');
	htp.formClose;
	htp.print('</div>');
	htp.bodyClose;
	htp.htmlClose;
END;
/


--3 Edition

--3.1.2 Page de validation d'édition
-------Appel à la requête pa_edit_categorie
CREATE OR REPLACE
PROCEDURE ui_execedit_categorie
	(
		vnumcategorie in number,
		vlibcategorie in varchar2
	)
IS
rep_css varchar2(255) := https://dl.dropboxusercontent.com/u/21548623/bootstrap.min.css;
BEGIN
	htp.print('<!DOCTYPE html>');
	htp.htmlOpen;
	htp.headOpen;
	htp.title('Edition table CATEGORIE');
	htp.print('<link href="' || rep_css || '" rel="stylesheet" type="text/css" />');
	htp.headClose;
	htp.bodyOpen;
	htp.print('<div class="container">');
	pa_edit_categorie(vnumcategorie,vlibcategorie);
	htp.header(1, 'LOLITA');
	htp.hr;
	htp.header(2, 'Edition effectuée dans la table CATEGORIE');
	htp.print('<a class="btn btn-primary" href="afft_categorie" >>Consulter la liste CATEGORIE</a>');
	htp.print('<a class="btn btn-primary" href="hello" >>Retour accueil</a>');
	htp.print('</div>');
	htp.bodyClose;
	htp.htmlClose;
EXCEPTION
	WHEN OTHERS THEN
		htp.print('ERROR: ' || SQLCODE);
END;
/


--3.1.3 Formulaire d'édition
------- Validation redirige vers ui_execedit_categorie
CREATE OR REPLACE PROCEDURE ui_frmadd_categorie
IS
	rep_css varchar2(255) := https://dl.dropboxusercontent.com/u/21548623/bootstrap.min.css;
BEGIN
	htp.print('<!DOCTYPE html>');
	htp.htmlOpen;
	htp.headOpen;
	htp.title('Edition categorie');
	htp.print('<link href="' || rep_css || '" rel="stylesheet" type="text/css" />');
	htp.headClose;
	htp.bodyOpen;
	htp.print('<div class="container">');
	htp.header(1, 'Edition categorie');
	htp.formOpen(owa_util.get_owa_service_path || 'ui_execedit_categorie', 'POST');
	htp.print('<table class="table">');
	htp.tableRowOpen;
	htp.tableData('vnumcategorie');
	htp.tableData(htf.formText('vnumcategorie', 4));
	htp.tableRowClose;
	htp.tableRowOpen;
	htp.tableData('vlibcategorie');
	htp.tableData(htf.formText('vlibcategorie', 50));
	htp.tableRowClose;
	htp.tableClose;
	htp.print('<button class="btn btn-primary" type="submit">Validation</button>');
	htp.formClose;
	htp.print('</div>');
	htp.bodyClose;
	htp.htmlClose;
END;
/


--3.1.1 Requête SQL
CREATE OR REPLACE
PROCEDURE pa_edit_categorie
	(
		vnumcategorie in number,
		vlibcategorie in varchar2
	)
IS
BEGIN
	UPDATE 
		CATEGORIE
	SET
		libcategorie = vlibcategorie
	WHERE 
		numcategorie = vnumcategorie
	COMMIT;
END;
/


--4 Suppression

--4.1.2 Page de validation de suppression
-------Appel à la requête pa_del_categorie
CREATE OR REPLACE
PROCEDURE ui_execdel_categorie
	(
		vnumcategorie in number
	)
IS
rep_css varchar2(255) := https://dl.dropboxusercontent.com/u/21548623/bootstrap.min.css;
BEGIN
	htp.print('<!DOCTYPE html>');
	htp.htmlOpen;
	htp.headOpen;
	htp.title('Suppression table CATEGORIE');
	htp.print('<link href="' || rep_css || '" rel="stylesheet" type="text/css" />');
	htp.headClose;
	htp.bodyOpen;
	htp.print('<div class="container">');
	pa_del_categorie(vnumcategorie)
	htp.header(1, 'LOLITA');
	htp.hr;
	htp.header(2, 'Suppression élément dans la table CATEGORIE');
	htp.print('<a class="btn btn-primary" href="afft_categorie" >>Consulter la liste CATEGORIE</a>');
	htp.print('<a class="btn btn-primary" href="hello" >>Retour accueil</a>');
	htp.print('</div>');
	htp.bodyClose;
	htp.htmlClose;
EXCEPTION
	WHEN OTHERS THEN
		htp.print('ERROR: ' || SQLCODE);
END;
/


--4.1.1 Requête SQL
CREATE OR REPLACE
PROCEDURE pa_del_categorie
	(
		vnumcategorie in number
	)
IS
BEGIN
	DELETE FROM 
		CATEGORIE
	WHERE 
		numcategorie = vnumcategorie
	COMMIT;
END;
/

