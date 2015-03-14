<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rechercher un stage</title>

<script language=javascript>
	function Chargement() {
		var obj = document.getElementById("id_erreur");
		if (obj.value != '')
			alert('Erreur signal�e  : "' + obj.value + "'");
	}
</script>
</head>
<body onLoad="Chargement();">
 <P><A href="index.jsp"><FONT face="Arial" color="#004080">Retour Accueil</FONT></A></P>
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
				<td>Num�ro</td>
				<td><input type="text" name="id" value="${stage.id}" id="id" /></td>
			</tr>
			<tr>
				<td>Libell�</td>
				<td><input type="text" name="libelle" value="${stage.libelle}"
					id="libelle" /></td>
			</tr>
			<tr>
				<td>Date de d�but du stage</td>
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

	<STRONG>R�sultat(s) de la recherche : </STRONG>
	</U>
	</FONT>
	</P>

	<TABLE BORDER="1">
		<CAPTION>Tableau des Stages</CAPTION>
		<TR>
			<TH>Numero</TH>
			<TH>Libell�</TH>
			<TH>Date d�but</TH>
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
</body>
</html>