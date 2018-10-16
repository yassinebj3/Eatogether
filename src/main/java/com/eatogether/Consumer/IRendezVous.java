package com.eatogether.Consumer;

import com.eatogether.Repository.RepositoryBean.RendezVousBean;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;

import java.util.ArrayList;
import java.util.Date;

public interface IRendezVous {

    public void createRendezvous(RendezVousBean rdv);

    public ArrayList<RendezVousBean> ConsulterRdv (UtilisateurBean user);

    public void deleteRdv (UtilisateurBean userconnected, UtilisateurBean userTodelete);

    public void UpdateDateRdv(RendezVousBean rdv, Date daterdv);


}
