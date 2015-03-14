<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <link href="css/united.min.css" rel="stylesheet" /> -->
<link href="ressources/stylesheets/bootstrap/css/united.min.css" rel="stylesheet" />
</head>
<body>
				<H1>Gestion des Stages HIGH TECH</H1>
				<BR> <BR>
				<H2>
					Nous sommes le
					<%=DateFormat.getDateTimeInstance(DateFormat.FULL,
					DateFormat.FULL).format(new Date())%>
				</H2>
<div class="col-md-2">
  <div class="list-group">
    
    <a class="list-group-item" href="Controleur?action=saisieStage">Saisie d'un stage</a>
    <a class="list-group-item" href="Controleur?action=afficheStage">Affichage de la liste des stages</a>
    <a class="list-group-item" href="Controleur?action=rechercheStage">Recherche d'un stage</a>
    <a class="list-group-item" href="Controleur?action=saisieModifierStage">Modifie un stage</a>
    <a class="list-group-item" href="Controleur?action=saisieSupprimerStage">SSupprime un stage</a>
  </div>
</div>
</body>
</html>
