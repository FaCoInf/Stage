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
		this.id = null;
		this.libelle = null;
		this.datedebut = null;
		this.datefin = null;
//		this.nbplaces = -1;
//		this.nbinscrits = -1;
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

	/* traitements mï¿½tier */

	public void insertionStage() throws MonException {

		try {
			String mysql = "";
			DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
			String dd = dateFormatpers.format(this.getDatedebut());
			String df = dateFormatpers.format(this.getDatefin());

			mysql = "INSERT INTO stages (id, libelle, datedebut ,"
					+ " datefin, nbplaces, nbinscrits) " + " VALUES ( \'"
					+ this.getId() + "\', \'" + this.getLibelle() + "\', "
					+ "\' " + dd + "\', " + "\' " + df + "\', "
					+ this.getNbplaces() + ", " + this.getNbinscrits() + " )";
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
				// On crï¿½e un stage
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
				// On incrï¿½mente tous les 6 champs
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
			 DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
			 String dd = null, df =null;
			 if(this.getDatedebut() !=null)
				 dd = dateFormatpers.format(this.getDatedebut());
			 if(this.getDatefin() !=null)
				 df  = dateFormatpers.format(this.getDatefin());
			 String np = Integer.toString(this.nbplaces);
			 String ni = Integer.toString(this.nbinscrits);

			 
			 
			mysql = "SELECT * FROM stages";
			if(this.getId() != null || this.getLibelle()!= null || dd != null || df != null || this.nbplaces != -1 || this.nbinscrits != -1){
				mysql = mysql + " WHERE ";
				if (this.getId() != null)
					mysql = this.ajoutElementSQL("WHERE ", mysql, "id", this.getId(),false);
				if( this.getLibelle()!= null)
					mysql = this.ajoutElementSQL("WHERE ", mysql,  "libelle", this.getLibelle(),true);
				if(this.getDatedebut() != null)
					mysql = this.ajoutElementSQL("WHERE ", mysql,  "datedebut", dd,true);
				if(this.getDatefin() != null)
					mysql = this.ajoutElementSQL("WHERE ", mysql,  "datefin", df,true);
				if(this.nbplaces != -1)
					mysql = this.ajoutElementSQL("WHERE ", mysql,  "nbplaces", np,false);
				if(this.nbinscrits != -1)
					mysql = this.ajoutElementSQL("WHERE ", mysql,  "nbinscrits", ni,false);
			}
			
			mysql = mysql + " ORDER BY id ASC";

			
			
			System.out.println("SQL : " + mysql);

			rs = DialogueBd.lecture(mysql);

			while (index < rs.size()) {
				// On crï¿½e un stage
				Stage unS = new Stage();
				// il faut redecouper la liste pour retrouver les lignes
				unS.setId(rs.get(index + 0).toString());
				unS.setLibelle(rs.get(index + 1).toString());
				unS.setDatedebut(dateFormatpers.parse(rs.get(index + 2)
						.toString()));
				unS.setDatefin((dateFormatpers.parse(rs.get(index + 3)
						.toString())));
				unS.setNbplaces(Integer.parseInt(rs.get(index + 4).toString()));
				unS.setNbinscrits(Integer
						.parseInt(rs.get(index + 5).toString()));
				// On incrï¿½mente tous les 6 champs
				index = index + 6;
				mesStages.add(unS);
			}

			return mesStages;

		} catch (MonException e) {
			throw e;
		}
	}

	public void modifierStage() throws MonException, ParseException {
		String mysql = "";
		DateFormat dateFormatpers = new SimpleDateFormat("yyyy-MM-dd");
		String dd = dateFormatpers.format(this.getDatedebut());
		String df = dateFormatpers.format(this.getDatefin());
		mysql += "UPDATE stages SET" 
				+ " libelle = '" + this.libelle + "'," 
				+ " datedebut = '" + dd + "',"
				+ " datefin = '" + df + "'," 
				+ " nbplaces = '"+ this.nbplaces + "'," 
				+ " nbinscrits = '" + this.nbinscrits+ "'"
				+ " WHERE id = " + this.id;

		DialogueBd.insertionBD(mysql);

	}
	
	public void supprimerStage() throws MonException{
		String mysql = "DELETE FROM stages WHERE id = "+this.id;
		DialogueBd.insertionBD(mysql);
	}

	private String ajoutElementSQL(String type, String sql, String element, String valeur,boolean isString){
	
		// On récupère les derniers caractères 
		String derniersCar = sql.substring(sql.length() - 6);
		
		if(derniersCar.equals(type)){
			sql = sql+element+"=";
		}else{
			sql = sql+" AND "+element+"=";
		}
		if(isString == true){
			sql = sql+"\'"+valeur+"\'";
		}else{
			sql = sql+valeur;
		}
		
		return sql;
	}

}
