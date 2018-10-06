
package com.eatogether.model ;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.eatogether.Controller.ConnectDB;

public class User {

	private static final long serialVersionUID = 1L;
	ConnectDB db = new ConnectDB();
	//private String login;
	private String mp;
	private String nom;
	private String prenom;
	private String pseudo;
	//private String date_naissance;
	private String email;
	
	
	public User() {
		super();
	}

	public User(String email, String mp) {
		super();
		this.email = email;
		this.mp = mp;
	}

	public User(String email, String mp, String nom, String prenom,
			 String pseudo) {
		super();
		this.email = email;
		this.mp = mp;
		this.nom = nom;
		this.prenom = prenom;
		this.pseudo=pseudo;
		
	}
	
	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}


	/*public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
*/
	public String getMp() {
		return mp;
	}

	public void setMp(String mp) {
		this.mp = mp;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public User getUser(String mp, String login) throws Exception {
		User U = new User();
		Connection conn = db.getConnexion();
		String query = "select * from UTILISATEUR where PASS='" + mp
				+ "' and EMAIL='" + login + "'";

		try (Statement stmt = conn.createStatement()) {
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			
			String nom = rs.getString("nom");
			String prenom = rs.getString("prenom");
			//String email = rs.getString("email");
			String pseudo=rs.getString("pseudo");
			
			

			U.setMp(mp);
			U.setEmail(email);
			U.setPrenom(prenom);
			U.setNom(nom);
			U.setPseudo(pseudo);

		}

		catch (SQLException e) {
			System.out.println("An exception occurred:  " + e.getMessage());
		}

		finally {
			db.closeConnexion(conn);
		}

		return U;

	}

	public int getNombre() throws Exception {
		int nombre = 0;
		Connection conn = db.getConnexion();
		String query = "select count(*) from utilisateur";

		try (Statement stmt = conn.createStatement()) {
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			nombre = rs.getInt(1);

		}

		catch (SQLException e) {
			System.out.println("An exception occurred:  " + e.getMessage());
		}

		finally {
			db.closeConnexion(conn);
		}

		return nombre;

	}
	

	public boolean isRegistred(String mp, String login) throws Exception {
		boolean registred = false;
		Connection conn = db.getConnexion();
		String query = "select count(*) from UTILISATEUR where PASS='" + mp
				+ "' and EMAIL='" + login + "'";

		
		try (Statement stmt = conn.createStatement()) {
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			int nb = rs.getInt(1);
			System.out.println("nb"+nb);
			if (nb > 0)
				registred = true;
		}

		catch (SQLException e) {
			System.out.println("An exception occurred: " + e.getMessage());
		}

		finally {
			db.closeConnexion(conn);
		}

		return registred;

	}

	public String insertUser(String mp, String login) throws Exception {
		String msg = "";
		if (mp != "" && login != "") {
			Connection conn = db.getConnexion();
			String query = "insert into UTILISATEUR(email,pass) values ('" + login
					+ "','" + mp + "')";
			try (Statement stmt = conn.createStatement()) {
				stmt.executeUpdate(query);

			} catch (SQLException e) {
				System.out.println("An exception occurred:  " + e.getMessage());
			}

			finally {
				db.closeConnexion(conn);
			}
		}

		else
			msg = "!! vous devez remplir tous les champs";
		return msg;
	}

	// Verify Values 

	public boolean okValues(String[] mp, String[] login) {
		boolean ok = true;
		int i = 0;
		while (i < mp.length && ok)// one loop because mp.length==login.length
		{
			if (mp[i] == "" || login[i] == "")
				ok = false;
			i++;
		}
		return ok;
	}

	// Update login and password 
	
	public String updateUser_compte(String mp, String email, String oldMp,
			String oldMail) throws Exception {
		String msg = "";
		if (mp != "" && email != "") {
			Connection conn = db.getConnexion();
			String query = "update UTILISATEUR set 'pass'= '" + mp + "' ,'email' ='"
					+ email + "' where 'email' ='"+ oldMail + "'";
			try (Statement stmt = conn.createStatement()) {
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				System.out.println("An exception occurred: " + e.getMessage());
			}

			finally {
				db.closeConnexion(conn);
			}
		}

		else
			msg = "!! vous devez remplir tous les champs";
		return msg;
	}
	
	public String updateUser_info(String email, String nom,
			String prenom, String pseudo) throws Exception {
		String msg = "";
		if (nom != "" && prenom != "" && pseudo !="") {
			Connection conn = db.getConnexion();
			String query = "update UTILISATEUR set 'nom='= '" + nom + "' , 'prenom'="
					+ prenom +"' ,'pseudo' = '"+pseudo +"' where 'email' = '" + email+"'" ;
			try (Statement stmt = conn.createStatement()) {
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				System.out.println("An exception occurred: " + e.getMessage());
			}

			finally {
				db.closeConnexion(conn);
			}
		}

		else
			msg = "!! vous devez remplir tous les champs";
		return msg;
	}

	// Delete User 
	
	public void deleteUser(String email) throws Exception {

		Connection conn = db.getConnexion();
		String query = "delete from UTILISATEUR where email='" + email + "'";
		try (Statement stmt = conn.createStatement()) {
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			System.out.println("An exception occurred: " + e.getMessage());
		}

		finally {
			db.closeConnexion(conn);
		}
	}

	// Insert User 


	public String insertUser1(String email, String mp,
			String nom, String Prenom,String pseudo) throws Exception {
		String msg = "";
		if (mp != "" && email != "") {
			Connection conn = db.getConnexion();
			String query = "insert into UTILISATEUR(EMAIL,PASS,NOM,PRENOM,PSEUDO) values ('"
					
					+ email
					+ "','"
					+ mp
					+ "','"
					+ nom 
					+"','"
					+Prenom
					+"','"
					+ pseudo + "')";
			try (Statement stmt = conn.createStatement()) {
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				System.out.println("An exception occurred: " + e.getMessage());
			}

			finally {
				db.closeConnexion(conn);
			}
		}

		else
			msg = "!! vous devez remplir tous les champs";
		return msg;
	}

}
