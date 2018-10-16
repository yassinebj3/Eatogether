package com.eatogether.Repository;

import java.util.Date;

public class RendezVous {

    private User idLiker;
    private User idTargetLiker;
    private int idRestraunt;
    private Date dateRdv ;
    private String note;

    public User getIdLiker() {
        return idLiker;
    }

    public void setIdLiker(User idLiker) {
        this.idLiker = idLiker;
    }

    public void setIdRestraunt(int idRestraunt) {
        this.idRestraunt = idRestraunt;
    }

    public User getIdTargetLiker() {
        return idTargetLiker;
    }

    public void setIdTargetLiker(User idTargetLiker) {
        this.idTargetLiker = idTargetLiker;
    }



    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }


    public Date getDateRdv() {
        return dateRdv;
    }

    public void setDateRdv(Date dateRdv) {
        this.dateRdv = dateRdv;
    }


    public RendezVous() {
    }

    public int getIdRestraunt() {
        return idRestraunt;
    }

    public RendezVous(User idLiker, User idTargetLiker, int idRestraunt, Date dateRdv, String note) {
        this.idLiker = idLiker;
        this.idTargetLiker = idTargetLiker;
        this.idRestraunt = idRestraunt;
        this.dateRdv = dateRdv;
        this.note = note;
    }
}
