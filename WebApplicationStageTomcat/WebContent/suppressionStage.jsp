<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="ressources/stylesheets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<title>Modifier un stage</title>

<script language=javascript>
	function verif() {
		if (document.getElementById("id").value == "")

		{
			alert("Le champs n'est pas rempli !");
			return false;
		} else
			return true;
	}
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
				<a href="index.jsp">Gestion des Stages HIGH TECH</a> <small><%=DateFormat.getDateTimeInstance(DateFormat.FULL,
					DateFormat.FULL).format(new Date())%></small>
			</h1>
		</div>

		<!-- Barre de navigation -->
		<div class="navbar-collapse collapse">
			<ul class="nav nav-pills nav-justified" class="nav">
				<li role="presentation"><a href="Controleur?action=saisieStage">Saisie
						d'un stage</a></li>
				<li role="presentation"><a
					href="Controleur?action=afficheStage">Affichage de la liste des
						stages</a></li>
				<li role="presentation"><a
					href="Controleur?action=rechercheStage">Recherche d'un stage</a></li>
				<li role="presentation"><a
					href="Controleur?action=saisieModifierStage">Modifie un stage</a></li>
				<li role="presentation" class="active"><a
					href="Controleur?action=saisieSupprimerStage">Supprime un stage</a></li>
			</ul>
		</div>

		<!--File d'ariane -->
		<ol class="breadcrumb">
			<li><a href="index.jsp">Retour Accueil</a></li>
			<li class="active">Suppression d'un stage</li>
		</ol>



		<!-- Contenu -->
		<section class="row">
		<h2 class="text-center">Formulaire de suppression d'un stage</h2>
		<input type="hidden" name="uneErreur" value="${MesErreurs}"
			id="id_erreur">
		<form class="form-horizontal" method="post" action="Controleur"
			onsubmit="return verif();">
			<input type="hidden" name="type" value="supprimer" id="type" /> <input
				type="hidden" name="action" value="supprimerStage" /> <label
				for="sel1">Séléctionner un stage à supprimer :</label> <select
				class="form-control" name="id" id="id">
				<c:forEach items="${liste}" var="item">
					<option value="${item.id}">${item.id}: ${item.libelle}</option>
				</c:forEach>
			</select>

			<!-- Boutons Ajouter/Reset -->
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-4 col-md-4 col-md-offset-5">
					<button type="submit" name="supprimerStage"
						class="btn btn-default btn-primary">
						Supprimer <span class="glyphicon glyphicon-remove"></span>
					</button>
					<button type="reset" name="reset"
						class="btn btn-default btn-primary">Reset</button>
				</div>
			</div>
		</form>
		</section>
</body>
</html>
