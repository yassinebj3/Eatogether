package com.eatogether.Consumer.Transformation.Implementation;

import com.eatogether.Consumer.IRendezVous;
import com.eatogether.Consumer.Transformation.IRendezVousTransformation;
import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Repository.RendezVous;
import com.eatogether.Repository.RepositoryBean.RendezVousBean;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;
import com.eatogether.Repository.User;

import java.sql.Timestamp;
import java.util.ArrayList;

public class TransformationRdv implements IRendezVousTransformation {

    IUserTransformation iUserTransformation = new TransformationUser();

    @Override
    public RendezVousBean fromRendezvousToRendezvousBean(RendezVous rdv) {

        RendezVousBean result = new RendezVousBean();
        if(rdv.getIdLiker()!=null)
        result.setIdsource(iUserTransformation.fromUserToUserBean(rdv.getIdLiker()));
        if(rdv.getIdTargetLiker()!=null)
        result.setIdvise(iUserTransformation.fromUserToUserBean(rdv.getIdTargetLiker()));
        result.setDaterdv(new Timestamp(rdv.getDateRdv().getTime()));
        result.setIdrestaurant(rdv.getIdRestraunt());
        result.setNote(rdv.getNote());


        return result;
    }

    @Override
    public RendezVous fromRendezvousBeanToRendezvous(RendezVousBean rdv) {
        RendezVous result = new RendezVous();

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
