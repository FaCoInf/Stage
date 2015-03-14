package metier;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import persistance.DialogueBd;
import meserreurs.MonException;

public class Stage {

	private String id;
	private String libelle;
	private Date datedebut;
	private Date datefin;
	private int nbplaces;
	private int nbinscrits;

	public Stage() {

		// TODO Auto-generated constructor stub
	}

	public Stage(String id, String libelle, Date datedebut, Date datefin,
			int nbplaces, int nbinscrits) {
		this.id = id;
		this.libelle = libelle;
		this.datedebut = datedebut;
		this.datefin = datefin;
		this.nbplaces = nbplaces;
		this.nbinscrits = nbinscrits;
	}

	public int getNbplaces() {
		return nbplaces;
	}

	public void setNbplaces(int nbplaces) {
		this.nbplaces = nbplaces;
	}

	public int getNbinscrits() {
		return nbinscrits;
	}

	public void setNbinscrits(int nbinscrits) {
		this.nbinscrits = nbinscrits;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public Date getDatedebut() {
		return datedebut;
	}

	public void setDatedebut(Date datedebut) {
		this.datedebut = datedebut;
	}

	public Date getDatefin() {
		return datefin;
	}

	public void setDatefin(Date datefin) {
		this.datefin = datefin;
	}

	/* traitements métier */

	public void insertionStage() throws MonException {

		try {
			String mysql = "";
			DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
			String dd = dateFormatpers.format(this.getDatedebut());
			String df = dateFormatpers.format(this.getDatefin());

			mysql = "INSERT INTO stages (id, libelle, datedebut ,";
			mysql = mysql + " datefin, nbplaces, nbinscrits) ";
			mysql = mysql + " VALUES ( \'" + this.getId() + "\', \'"
					+ this.getLibelle() + "\', ";
			mysql = mysql + "\' " + dd + "\', " + "\' " + df + "\', ";
			mysql = mysql + this.getNbplaces() + ", " + this.getNbinscrits()
					+ " )";
			DialogueBd.insertionBD(mysql);
		} catch (MonException e) {
			throw e;
		}
	}

	public List<Stage> rechercheLesStages() throws MonException, ParseException {
		List<Object> rs;
		List<Stage> mesStages = new ArrayList<Stage>();
		int index = 0;
		try {
			String mysql = "";

			mysql = "SELECT * FROM stages ORDER BY id ASC";

			rs = DialogueBd.lecture(mysql);

			while (index < rs.size()) {
				// On crée un stage
				Stage unS = new Stage();
				// il faut redecouper la liste pour retrouver les lignes
				unS.setId(rs.get(index + 0).toString());
				unS.setLibelle(rs.get(index + 1).toString());
				DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
				unS.setDatedebut(dateFormatpers.parse(rs.get(index + 2)
						.toString()));
				unS.setDatefin((dateFormatpers.parse(rs.get(index + 3)
						.toString())));
				unS.setNbplaces(Integer.parseInt(rs.get(index + 4).toString()));
				unS.setNbinscrits(Integer
						.parseInt(rs.get(index + 5).toString()));
				// On incrémente tous les 6 champs
				index = index + 6;
				mesStages.add(unS);
			}

			return mesStages;

		} catch (MonException e) {
			System.out.println(e.getMessage());
			throw e;
		}

	}

	public List<Stage> rechercheDesStages() throws MonException, ParseException {
		List<Stage> mesStages = new ArrayList<Stage>();
		int index = 0;
		List<Object> rs;
		try {

			String mysql = "";
			// DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
			// String dd = dateFormatpers.format(this.getDatedebut());
			// String df = dateFormatpers.format(this.getDatefin());
			// String np = Integer.toString(this.nbplaces);
			// String ni = Integer.toString(this.nbinscrits);

			mysql = "SELECT * FROM stages"; // WHERE ";
			if (this.getId() != "" && this.getId() != null)
				mysql = mysql + " WHERE id=" + this.getId();
			// if( this.getLibelle()!= null){
			// mysql = mysql + "libelle=" + this.getLibelle();
			// }
			// if(dd != null){
			// mysql = mysql + " datedebut="+ dd;
			// if(df != null)
			// mysql = mysql + " datefin="+ df;
			// if(np != null)
			// mysql = mysql + " nbplaces="+ this.nbplaces;
			// if(ni != null)
			// mysql = mysql + " nbinscrits="+ this.nbinscrits;
			mysql = mysql + " ORDER BY id ASC";

			System.out.println("SQL : " + mysql);

			rs = DialogueBd.lecture(mysql);

			while (index < rs.size()) {
				// On crée un stage
				Stage unS = new Stage();
				// il faut redecouper la liste pour retrouver les lignes
				unS.setId(rs.get(index + 0).toString());
				unS.setLibelle(rs.get(index + 1).toString());
				DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
				unS.setDatedebut(dateFormatpers.parse(rs.get(index + 2)
						.toString()));
				unS.setDatefin((dateFormatpers.parse(rs.get(index + 3)
						.toString())));
				unS.setNbplaces(Integer.parseInt(rs.get(index + 4).toString()));
				unS.setNbinscrits(Integer
						.parseInt(rs.get(index + 5).toString()));
				// On incrémente tous les 6 champs
				index = index + 6;
				mesStages.add(unS);
			}

			return mesStages;

		} catch (MonException e) {
			throw e;
		}

	}
}
