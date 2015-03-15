<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="ressources/stylesheets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="ressources/stylesheets/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Affichage de tous les stages</title>
</head>
<body>
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
				<li role="presentation"><a href="Controleur?action=saisieStage">Saisie d'un
						stage</a></li>
				<li role="presentation" class="active"><a href="Controleur?action=afficheStage">Affichage de
						la liste des stages</a></li>
				<li role="presentation"><a href="Controleur?action=rechercheStage">Recherche
						d'un stage</a></li>
				<li role="presentation"><a href="Controleur?action=saisieModifierStage">Modifie
						un stage</a></li>
				<li role="presentation"><a href="Controleur?action=saisieSupprimerStage">Supprime
						un stage</a></li>
			</ul>
		</div>

		<!--File d'ariane -->
		<ol class="breadcrumb">
			<li><a href="index.jsp">Retour Accueil</a></li>
			<li class="active">Affichage de la liste des stages</li>
		</ol>

		<!-- Contenu -->
		<section class="row">
			<h2 class="text-center">Listing des Stages</h2>
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
