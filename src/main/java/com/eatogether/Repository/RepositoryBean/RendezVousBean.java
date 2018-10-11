package com.eatogether.Repository.RepositoryBean;

public class RendezVousBean {

    private int idLiker;
    private int idTargetLiker;
    private int idRestraunt;

    public int getIdLiker() {
        return idLiker;
    }

    public void setIdLiker(int idLiker) {
        this.idLiker = idLiker;
    }

    public int getIdTargetLiker() {
        return idTargetLiker;
    }

    public void setIdTargetLiker(int idTargetLiker) {
        this.idTargetLiker = idTargetLiker;
    }

    public int getIdRestraunt() {
        return idRestraunt;
    }

    public void setIdRestraunt(int idRestraunt) {
        this.idRestraunt = idRestraunt;
    }

    public RendezVousBean(int idLiker, int idTargetLiker, int idRestraunt) {
        this.idLiker = idLiker;
        this.idTargetLiker = idTargetLiker;
        this.idRestraunt = idRestraunt;
    }

    public RendezVousBean() {
    }
}
