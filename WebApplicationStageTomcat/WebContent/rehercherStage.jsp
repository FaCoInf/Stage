<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
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
				<a href="index.jsp">Gestion des Stages HIGH TECH</a> <small><%=DateFormat.getDateTimeInstance(DateFormat.FULL,
					DateFormat.FULL).format(new Date())%></small>
			</h1>
		</div>

		<!-- Barre de navigation -->
		<div class="navbar-collapse collapse">
			<ul class="nav nav-pills nav-justified">
				<li role="presentation" ><a href="Controleur?action=saisieStage">Saisie d'un
						stage</a></li>
				<li role="presentation" ><a href="Controleur?action=afficheStage">Affichage de
						la liste des stages</a></li>
				<li role="presentation"  class="active"><a href="Controleur?action=rechercheStage">Recherche
						d'un stage</a></li>
				<li role="presentation" ><a href="Controleur?action=saisieModifierStage">Modifie
						un stage</a></li>
				<li role="presentation" ><a href="Controleur?action=saisieSupprimerStage">Supprime
						un stage</a></li>
			</ul>
		</div>

		<!--File d'ariane -->
		<ol class="breadcrumb">
			<li><a href="index.jsp">Retour Accueil</a></li>
			<li class="active">Recherche de Stage</li>
		</ol>

		<!-- Contenu -->
		<section class="row">
			<h2 class="text-center">Recherche d'un stage</h2>
			<br>
			<input type="hidden" name="uneErreur" value="${MesErreurs}"
				id="id_erreur">
			<form class="form-inline" method="post" action="Controleur">
				<input type="hidden" name="type" value="cherche" id="type" /> <input
					type="hidden" name="action" value="chercheStage" />
	
				<!-- input fields -->
				<div class="form-group">
					<label>Numéro</label>
					<div>
						<input type="text" name="id" value="${stage.id}" id="id"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label>Libellé</label>
					<div>
						<input type="text" name="libelle" value="${stage.libelle}"
							id="libelle" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label>Date de début du stage</label>
					<div>
						<input type="text" name="datedebut"
							value="<fmt:formatDate type="both" dateStyle="short"
									timeStyle="short" value="${stage.datedebut}" pattern="dd/MM/yyyy" />"
							id="datedebut" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label>Date de fin de stage</label>
					<div>
						<input type="text" name="datefin"
							value="<fmt:formatDate type="both" dateStyle="short"
									timeStyle="short" value="${stage.datefin}" pattern="dd/MM/yyyy" />"
							id="datefin" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label>Nombre de places</label>
					<div>
						<input type="text" name="nbplaces" value="" id="nbplaces"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label>Nombre d'inscrits</label>
					<div>
						<input type="text" name="nbinscrits" value="" id="nbinscrits"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<div>
						<button type="submit" name="recherche"
							class="btn btn-default btn-primary">
							Recherche <span class="glyphicon glyphicon-search"></span>
						</button>
						<button type="reset" name="reset"
							class="btn btn-default btn-primary">Reset</button>
					</div>
				</div>
			</form>
		</section>

		<section class="row">
			<h3>Résultat(s) de la recherche :</h3>
			<table class="table table-bordered">
				<!-- 				<CAPTION>Tableau des Stages</CAPTION> -->
				<thead>
					<tr>
						<th data-field="id" class="col-md-2">Numero</th>
						<th data-field="libelle" class="col-md-2">Libellé</th>
						<th data-field="datedebut" class="col-md-2">Date début</th>
						<th data-field="datefin" class="col-md-2">Date fin</th>
						<th data-field="nbplaces" class="col-md-2">Nombre de places</th>
						<th data-field="nbinscrits" class="col-md-2">Nombre d'inscrits</th>
					</tr>
				</thead>
				<tbody>
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
				</tbody>
			</table>
		</section>
	</div>
</body>
</html>