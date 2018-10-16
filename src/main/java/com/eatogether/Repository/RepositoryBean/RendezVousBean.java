package com.eatogether.Repository.RepositoryBean;

import com.eatogether.Repository.User;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "RendezVous")
public class RendezVousBean {

    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "incrementator")
    @GenericGenerator(name = "incrementator",strategy = "increment")
    private int idRdv;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idLiker", referencedColumnName = "id")
    private UtilisateurBean idsource;



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idTarget", referencedColumnName = "id")
    private UtilisateurBean idvise;

    @Column(name = "idRestaurant")
    private int idrestaurant;

    @Column(name = "dateTodate")
    private Date daterdv;

    @Column(name = "note")
    private String note;




    public int getIdRdv() {
        return idRdv;
    }

    public void setIdRdv(int idRdv) {
        this.idRdv = idRdv;
    }

    public UtilisateurBean getIdsource() {
        return idsource;
    }

    public void setIdsource(UtilisateurBean idsource) {
        this.idsource = idsource;
    }

    public UtilisateurBean getIdvise() {
        return idvise;
    }

    public void setIdvise(UtilisateurBean idvise) {
        this.idvise = idvise;
    }

    public int getIdrestaurant() {
        return idrestaurant;
    }

    public void setIdrestaurant(int idrestaurant) {
        this.idrestaurant = idrestaurant;
    }

    public Date getDaterdv() {
        return daterdv;
    }

    public void setDaterdv(Date daterdv) {
        this.daterdv = daterdv;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public RendezVousBean(UtilisateurBean idsource, UtilisateurBean idvise, int idrestaurant, Date daterdv, String note) {
        this.idsource = idsource;
        this.idvise = idvise;
        this.idrestaurant = idrestaurant;
        this.daterdv = daterdv;
        this.note = note;
    }

    public RendezVousBean() {
    }
}
