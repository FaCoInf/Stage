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
<title>Gestion des stages</title></head>
<body>
	<!-- Conteneur principal -->
	<div class="container">

		<!-- Entete -->
		<div class="page-header">
			<h1>
				<a href="#">Gestion des Stages HIGH TECH</a> <small><%=DateFormat.getDateTimeInstance(DateFormat.FULL,
					DateFormat.FULL).format(new Date())%></small>
			</h1>
		</div>

		<!-- Barre de navigation -->
		<div class="navbar-collapse collapse">
			<ul class="nav nav-justified">
				<li><a href="Controleur?action=saisieStage">Saisie d'un
						stage</a></li>
				<li><a href="Controleur?action=afficheStage">Affichage de
						la liste des stages</a></li>
				<li><a href="Controleur?action=rechercheStage">Recherche
						d'un stage</a></li>
				<li><a href="Controleur?action=saisieModifierStage">Modifie
						un stage</a></li>
				<li><a href="Controleur?action=saisieSupprimerStage">Supprime
						un stage</a></li>
			</ul>
		</div>
		
		<!-- Contenu -->
		<section class="row">
        <div class="col-lg-12">
	        <figure>
	          <img class="img-responsive center-block" src="ressources/pictures/stage.jpg" alt="Image de stage" />
	          <figcaption><!-- Legende associe --></figcaption>
	        </figure>
        </div>
        </section>
        
<!--         <footer class="row"> -->
<!--         <div class="col-sm-12"> -->
<!--           Pied de page -->
<!--         </div> -->
<!--       </footer> -->
		
	</div>
</body>
</html>
