package com.eatogether.Consumer.Transformation.Implementation;

import com.eatogether.Consumer.IRendezVous;
import com.eatogether.Consumer.Transformation.IRendezVousTransformation;
import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Repository.RendezVous;
import com.eatogether.Repository.RepositoryBean.RendezVousBean;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;
import com.eatogether.Repository.User;

import java.util.ArrayList;

public class TransformationRdv implements IRendezVousTransformation {

    IUserTransformation iUserTransformation = new TransformationUser();

    @Override
    public RendezVousBean fromRendezvousToRendezvousBean(RendezVous rdv) {

        RendezVousBean result = new RendezVousBean();
        UtilisateurBean user1= new UtilisateurBean();
        UtilisateurBean user2 = new UtilisateurBean();
        result.setIdsource(iUserTransformation.fromUserToUserBean(rdv.getIdLiker()));
        result.setIdvise(iUserTransformation.fromUserToUserBean(rdv.getIdTargetLiker()));
        result.setDaterdv(rdv.getDateRdv());
        result.setIdrestaurant(rdv.getIdRestraunt());
        result.setNote(rdv.getNote());


        return result;
    }

    @Override
    public RendezVous fromRendezvousBeanToRendezvous(RendezVousBean rdv) {
        RendezVous result = new RendezVous();
        User user1= new User();
        User user2 = new User();
        result.setIdLiker(iUserTransformation.fromUserBeanToUser(rdv.getIdsource()));
        result.setIdTargetLiker(iUserTransformation.fromUserBeanToUser(rdv.getIdvise()));
        result.setDateRdv(rdv.getDaterdv());
        result.setIdRestraunt(rdv.getIdrestaurant());
        result.setNote(rdv.getNote());

        return result;
    }

    @Override
    public ArrayList<RendezVous> fromListeRendezvousBeanToListeRendezvous(ArrayList<RendezVousBean> listerdv) {

        ArrayList<RendezVous> liste= new ArrayList<>();

        for(RendezVousBean rdv : listerdv)
        {
            liste.add(fromRendezvousBeanToRendezvous(rdv));
        }


        return liste;
    }
}
