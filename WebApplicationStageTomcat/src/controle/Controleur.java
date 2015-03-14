package controle;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;

import meserreurs.MonException;
import metier.Stage;

@WebServlet("/Controleur")
public class Controleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ACTION_TYPE = "action";
	private static final String SAISIE_STAGE = "saisieStage";
	private static final String AFFICHER_STAGE = "afficheStage";
	private static final String RECHERCHER_STAGE = "rechercheStage";
	private static final String CHERCHER_STAGE = "chercheStage";
	private static final String AJOUT_STAGE = "ajoutStage";
	private static final String SAISIE_MODIFIER_STAGE = "saisieModifierStage";
	private static final String MODIFIER_STAGE = "modifierStage";
	private static final String SAISIE_SUPPRIMER_STAGE = "saisieSupprimerStage";
	private static final String SUPPRIMER_STAGE = "supprimerStage";
	private static final String ERROR_PAGE = null;

	// le format est une combinaison de MM dd yyyy avec / ou ï¿½
	// exemple dd/MM/yyyy
	public Date conversionChaineenDate(String unedate, String unformat)
			throws Exception {
		Date datesortie;
		// on dï¿½finit un format de sortie
		SimpleDateFormat defFormat = new SimpleDateFormat(unformat);
		datesortie = defFormat.parse(unedate);
		 
		return datesortie;
	}

	protected void processusTraiteRequete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			MonException, Exception {
		String actionName = request.getParameter(ACTION_TYPE);
		String destinationPage = ERROR_PAGE;
		List<Stage> listeStages = null;
		// execute l'action

		if (SAISIE_STAGE.equals(actionName)) {
			request.setAttribute("stage", new Stage());
			destinationPage = "/saisieStage.jsp";
		}

		else if (AJOUT_STAGE.equals(actionName)) {
			try {
				Stage unStage = new Stage();
				unStage.setId(request.getParameter("id"));
				unStage.setLibelle(request.getParameter("libelle"));
				unStage.setDatedebut(conversionChaineenDate(
						request.getParameter("datedebut"), "dd/MM/yyyy"));
				unStage.setDatefin(conversionChaineenDate(
						request.getParameter("datefin"), "dd/MM/yyyy"));
				unStage.setNbplaces(Integer.parseInt(request
						.getParameter("nbplaces")));
				unStage.setNbinscrits(Integer.valueOf(
						(request.getParameter("nbplaces"))).intValue());
				unStage.setNbinscrits(Integer.valueOf(
						(request.getParameter("nbinscrits"))).intValue());
				unStage.insertionStage();
				destinationPage = "/index.jsp";
			} catch (Exception e) {
				request.setAttribute("MesErreurs", e.getMessage());
				System.out.println(e.getMessage());
			}

		} else if (AFFICHER_STAGE.equals(actionName)) {
			try {
				Stage unStage = new Stage();
				request.setAttribute("affichageListe", 1);
				listeStages = unStage.rechercheLesStages();
				request.setAttribute("liste", listeStages);
				destinationPage = "/afficherStages.jsp";
			} catch (MonException e) {
				request.setAttribute("MesErreurs", e.getMessage());
				destinationPage = "/Erreur.jsp";

			}

		} else if (RECHERCHER_STAGE.equals(actionName)) {
//			try {
				request.setAttribute("rechercherStage", 1);
				Stage unStage = new Stage();
//				listeStages = unStage.rechercheLesStages(); //grise
//				request.setAttribute("liste", listeStages);
				destinationPage = "/rehercherStage.jsp";
//			} catch (MonException e) {
//				request.setAttribute("MesErreurs", e.getMessage());
//				destinationPage = "/Erreur.jsp";
//
//			}

		} else if (CHERCHER_STAGE.equals(actionName)) {
			try {
				request.setAttribute("rechercherStage", 1);
				Stage unStage = new Stage();
				request.setAttribute("stage", unStage);

				// Récupération des attributs de la recherche
				if(request.getParameter("id") != "")
					unStage.setId(request.getParameter("id"));
				if(request.getParameter("libelle") != "")
					unStage.setLibelle(request.getParameter("libelle"));
				if(request.getParameter("datedebut") != "")
					unStage.setDatedebut(conversionChaineenDate(
						request.getParameter("datedebut"), "dd/MM/yyyy"));
				if(request.getParameter("datefin") != "")
					unStage.setDatefin(conversionChaineenDate(
						request.getParameter("datefin"), "dd/MM/yyyy"));
				if(request.getParameter("nbplaces") != ""){
					unStage.setNbplaces(Integer.parseInt(request
						.getParameter("nbplaces")));
				}else
				{
					unStage.setNbplaces(-1);
				}
				if(request.getParameter("nbinscrits") != ""){
					unStage.setNbinscrits(Integer.parseInt((request
						.getParameter("nbinscrits"))));
				}else{
					unStage.setNbinscrits(-1);
				}
				
				listeStages = unStage.rechercheDesStages();
				request.setAttribute("liste", listeStages);
//				unStage = new Stage();
//				request.setAttribute("stage", unStage);
				
				destinationPage = "/rehercherStage.jsp";
			} catch (MonException e) {
				request.setAttribute("MesErreurs", e.getMessage());
				destinationPage = "/Erreur.jsp";

			}

		} else if (SAISIE_MODIFIER_STAGE.equals(actionName)) {
			System.out.println("Saisie Modifier stage");
			request.setAttribute("stage", new Stage());
			destinationPage = "/modificationStage.jsp";
		} else if (MODIFIER_STAGE.equals(actionName)) {
			System.out.println("Modifier stage");
			Stage unStage = new Stage();
			unStage.setId(request.getParameter("id"));
			unStage.setLibelle(request.getParameter("libelle"));
			unStage.setDatedebut(conversionChaineenDate(
					request.getParameter("datedebut"), "yyyy/MM/dd"));
			unStage.setDatefin(conversionChaineenDate(
					request.getParameter("datefin"), "yyyy/MM/dd"));
			unStage.setNbplaces(Integer.parseInt(request
					.getParameter("nbplaces")));
			unStage.setNbinscrits(Integer.valueOf(
					(request.getParameter("nbplaces"))).intValue());
			unStage.setNbinscrits(Integer.valueOf(
					(request.getParameter("nbinscrits"))).intValue());
			unStage.modifierStage();
			destinationPage = "/index.jsp";
		}else if(SAISIE_SUPPRIMER_STAGE.equals(actionName)){
			System.out.println("Saisie supprimer stage");
			request.setAttribute("stage", new Stage());
			destinationPage = "/suppressionStage.jsp";
		}else if(SUPPRIMER_STAGE.equals(actionName)){
			System.out.println("Supprimer stage");
			Stage unStage = new Stage();
			unStage.setId(request.getParameter("id"));
			unStage.supprimerStage();
			destinationPage = "/index.jsp";
		}
		// Redirection vers la page jsp appropriee
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher(destinationPage);
		dispatcher.forward(request, response);
	}

	// Lï¿½appel de cette procï¿½dure se fait avec :

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processusTraiteRequete(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processusTraiteRequete(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			;
		}
	}
}
