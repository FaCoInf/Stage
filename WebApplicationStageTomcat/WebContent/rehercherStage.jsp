<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <link href="ressources/stylesheets/bootstrap/css/united.min.css" -->
<!-- 	rel="stylesheet" /> -->
<link href="ressources/stylesheets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="ressources/stylesheets/css/style.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rechercher un stage</title>

<script language=javascript>
	function Chargement() {
		var obj = document.getElementById("id_erreur");
		if (obj.value != '')
			alert('Erreur signalée  : "' + obj.value + "'");
	}
</script>
</head>
<body onLoad="Chargement();">
<!-- Conteneur principal -->
	<div class="container">

		<!-- Entete -->
		<div class="page-header">
			<h1>
				<a href="index.jsp">Gestion des Stages HIGH TECH</a>
			</h1>
		</div>
		
		<!--File d'ariane -->
		<ol class="breadcrumb">
		  <li><a href="index.jsp">Retour Accueil</a></li>
		  <li class="active">Recherche de Stage</li>
		</ol>
		
		<!-- Contenu -->
		
	<h1>Formulaire de recherche d'un stage</h1>
	<br>

	<input type="hidden" name="uneErreur" value="${MesErreurs}"
		id="id_erreur">
	<form method="post" action="Controleur">
		<input type="hidden" name="type" value="cherche" id="type" /> <input
			type="hidden" name="action" value="chercheStage" />
		<table>
			<!-- input fields -->
			<tr>
				<td>Numéro</td>
				<td><input type="text" name="id" value="${stage.id}" id="id" /></td>
			</tr>
			<tr>
				<td>Libellé</td>
				<td><input type="text" name="libelle" value="${stage.libelle}"
					id="libelle" /></td>
			</tr>
			<tr>
				<td>Date de début du stage</td>
				<td><input type="text" name="datedebut"
					value="<fmt:formatDate type="both" dateStyle="short"
						timeStyle="short" value="${stage.datedebut}" pattern="dd/MM/yyyy" />" id="datedebut"/></td>
			</tr>
			<tr>
				<td>Date de fin de stage</td>
				<td><input type="text" name="datefin" value="<fmt:formatDate type="both" dateStyle="short"
						timeStyle="short" value="${stage.datefin}" pattern="dd/MM/yyyy" />"
					id="datefin" /></td>
			</tr>

			<tr>
				<td>Nombre de places</td>
				<td><input type="text" name="nbplaces"
					value="" id="nbplaces" /></td>
			</tr>
			<tr>
				<td>Nombre d'inscrits</td>
				<td><input type="text" name="nbinscrits"
					value="" id="nbinscrits" /></td>
			</tr>
			<!-- Boutons Ajouter/Reset -->
			<tr>
				<td colspan="2"><input type="submit" name="recherche"
					value="Recherche" /> &nbsp;&nbsp; <input type="reset" name="reset"
					value="Reset" /></td>
			</tr>
		</table>
	</form>

	<STRONG>Résultat(s) de la recherche : </STRONG>
	</U>
	</FONT>
	</P>

	<TABLE BORDER="1">
		<CAPTION>Tableau des Stages</CAPTION>
		<TR>
			<TH>Numero</TH>
			<TH>Libellé</TH>
			<TH>Date début</TH>
			<TH>Date fin</TH>
			<TH>Nombre de places</TH>
			<TH>Nombre d'inscrits</TH>
		</TR>

		<c:forEach items="${liste}" var="item">
			<tr>
				<td>${item.id}</td>
				<td>${item.libelle}</td>
				<td><fmt:formatDate type="both" dateStyle="short"
						timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy" />
				</td>
				<td><fmt:formatDate type="both" dateStyle="short"
						timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy" />
				</td>

				<td>${item.nbplaces}</td>
				<td>${item.nbinscrits}</td>

			</tr>
		</c:forEach>
	</TABLE>
	</div>
</body>
</html>