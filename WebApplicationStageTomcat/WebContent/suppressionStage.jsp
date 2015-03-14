<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modifier un stage </title>

<script language=javascript>
  function verif()
  {
  if(document.getElementById("id").value == "" )
    
       { alert("Le champs n'est pas rempli !"); 
         return false; 
       }
  else
    return true;
  }
  function Chargement()
  {
      var obj = document.getElementById("id_erreur");
      if (obj.value!='')
         alert('Erreur signalée  : "'+obj.value+"'");
  }
  </script>
</head>
<body  onLoad="Chargement();">
<h1>formulaire d'ajout d'un stage</h1>
  <br>
  
  <input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
  <form method="post" action="Controleur" onsubmit="return verif();">
  <input type="hidden" name="type" value="supprimer"  id="type"/>
  <input type="hidden" name="action" value="supprimerStage" />
  <table>
    <!-- input fields -->
    <tr>
      <td>Numéro</td>
      <td><input type="text" name="id" value="${stage.id}" id="id"/></td>
    </tr>
   
    <!-- Boutons Ajouter/Reset -->
    <tr>
      <td colspan="2">
        <input type="submit" name="supprimerStage" value="Supprimer"/>
        &nbsp;&nbsp;
        <input type="reset" name="reset" value="Reset" />
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
