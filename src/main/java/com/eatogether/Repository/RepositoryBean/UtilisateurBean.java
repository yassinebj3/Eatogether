package com.eatogether.Repository.RepositoryBean;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Users")
public class UtilisateurBean {
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "incrementator")
    @GenericGenerator(name = "incrementator",strategy = "increment")
    private int id;

    @Column(name = "name")
    private String prenom;

    @Column(name = "secondname")
    private String nom;

    @Column(name = "pseudo")
    private String pseudo;

    @Column(name = "password")
    private String motpasse;

    @Column(name = "mail")
    private String adressemail;

    @Column(name = "dateofbirth")
    private Date datedenaissance;

    @OneToMany(mappedBy = "idsource", fetch = FetchType.EAGER)
    private List<RendezVousBean> listesourcerdv ;

    @OneToMany(mappedBy = "idvise" , fetch = FetchType.EAGER)
    private List<RendezVousBean> listetarget ;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getMotpasse() {
        return motpasse;
    }

    public void setMotpasse(String motpasse) {
        this.motpasse = motpasse;
    }

    public String getAdressemail() {
        return adressemail;
    }

    public void setAdressemail(String adressemail) {
        this.adressemail = adressemail;
    }

    public Date getDatedenaissance() {
        return datedenaissance;
    }

    public void setDatedenaissance(Date datedenaissance) {
        this.datedenaissance = datedenaissance;
    }

    public UtilisateurBean(String prenom, String nom, String pseudo, String motpasse, String adressemail, Date datedenaissance) {
        this.prenom = prenom;
        this.nom = nom;
        this.pseudo = pseudo;
        this.motpasse = motpasse;
        this.adressemail = adressemail;
        this.datedenaissance = datedenaissance;
    }

    public UtilisateurBean(String nom) {
        this.nom = nom;
    }

    public UtilisateurBean() {

    }

    public List<RendezVousBean> getListesourcerdv() {
        return listesourcerdv;
    }

    public void setListesourcerdv(List<RendezVousBean> listesourcerdv) {
        this.listesourcerdv = listesourcerdv;
    }

    public List<RendezVousBean> getListetarget() {
        return listetarget;
    }

    public void setListetarget(List<RendezVousBean> listetarget) {
        this.listetarget = listetarget;
    }
}
