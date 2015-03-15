<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="ressources/stylesheets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="ressources/stylesheets/css/style.css" rel="stylesheet">
<title>Ajout d'un stage</title>

<script language=javascript>
	function verif() {
		if (document.getElementById("id").value == ""
				|| document.getElementById("libelle").value == ""
				|| document.getElementById("datedebut").value == ""
				|| document.getElementById("datefin").value == "") {
			alert("Un des champs n'est pas rempli !");
			return false;
		} else
			return true;
	}
	function Chargement() {
		var obj = document.getElementById("id_erreur");
		if (obj.value != '')
			alert('Erreur signalée  : "' + obj.value + "'");
	}
	
// 	$(document).ready(function () {
//         $('ul.nav > li').click(function (e) {
//             e.preventDefault();
//             $('ul.nav > li').removeClass('active');
//             $(this).addClass('active');                
//         });            
//     });
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
				<li role="presentation" class="active"><a href="Controleur?action=saisieStage">Saisie d'un
						stage</a></li>
				<li role="presentation"><a href="Controleur?action=afficheStage">Affichage de
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
			<li class="active">Saisie d'un stage</li>
		</ol>

		<!-- Contenu -->
		<section class="row">
			<h2 class="text-center">Formulaire d'ajout d'un stage</h2>
			<input type="hidden" name="uneErreur" value="${MesErreurs}"
				id="id_erreur">
			<form class="form-horizontal" method="post" action="Controleur"
				onsubmit="return verif();">
				<input type="hidden" name="type" value="ajout" id="type" /> <input
					type="hidden" name="action" value="ajoutStage" />
	
				<!-- input fields -->
				<div class="form-group">
					<label class="col-sm-4 col-md-5 control-label">Numéro</label>
					<div class="col-sm-6 col-md-4">
						<input type="text" name="id" value="${stage.id}" id="id"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 col-md-5 control-label">Libellé</label>
					<div class="col-sm-6 col-md-4">
						<input type="text" name="libelle" value="${stage.libelle}"
							id="libelle" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 col-md-5 control-label">Date de début
						du stage</label>
					<div class="col-sm-6 col-md-4">
						<input type="text" name="datedebut"
							value="${stage.datedebut}" pattern="dd/MM/yyyy"
							id="datedebut" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 col-md-5 control-label">Date de fin
						de stage</label>
					<div class="col-sm-6 col-md-4">
						<input type="text" name="datefin"
							value="${stage.datefin}" pattern="dd/MM/yyyy"
							id="datefin" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 col-md-5 control-label">Nombre de
						places</label>
					<div class="col-sm-6 col-md-4">
						<input type="text" name="nbplaces" value="${stage.nbplaces}"
							id="nbplaces" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 col-md-5 control-label">Nombre
						d'inscrits</label>
					<div class="col-sm-6 col-md-4">
						<input type="text" name="nbinscrits" value="${stage.nbinscrits}"
							id="nbinscrits" class="form-control" />
					</div>
				</div>
	
				<!-- Boutons Ajouter/Reset -->
				<div class="form-group">
					<div class="col-sm-6 col-sm-offset-4 col-md-4 col-md-offset-5">
						<button type="submit" name="ajouter"
							class="btn btn-default btn-primary">
							Ajouter <span class="glyphicon glyphicon-plus"></span>
						</button>
						<button type="reset" name="reset"
							class="btn btn-default btn-primary">Reset</button>
					</div>
				</div>
			</form>
		</section>
	</div>
</body>
</html>
