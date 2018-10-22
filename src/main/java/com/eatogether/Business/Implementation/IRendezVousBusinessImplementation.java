package com.eatogether.Business.Implementation;

import com.eatogether.Business.IRendezVousBusiness;
import com.eatogether.Consumer.IRendezVous;
import com.eatogether.Consumer.IUsers;
import com.eatogether.Consumer.Implemenation.RendezVousImplementation;
import com.eatogether.Consumer.Implemenation.UsersImplementation;
import com.eatogether.Consumer.Transformation.IRendezVousTransformation;
import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Consumer.Transformation.Implementation.TransformationRdv;
import com.eatogether.Consumer.Transformation.Implementation.TransformationUser;
import com.eatogether.Repository.RendezVous;
import com.eatogether.Repository.RepositoryBean.RendezVousBean;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;
import com.eatogether.Repository.User;

import java.util.Date;
import java.util.List;

public class IRendezVousBusinessImplementation implements IRendezVousBusiness {

    IRendezVous iRendezVous = new RendezVousImplementation();
    IRendezVousTransformation iRendezVousTransformation = new TransformationRdv();
    private IUsers iUsers = new UsersImplementation();
    IUserTransformation iUserTransformation = new TransformationUser();
    @Override
    public RendezVous CreateRdvWithouTarget(String user, RendezVous rendezVous) {

        UtilisateurBean utilisateurBean= iUsers.getUserDetails(user);
        RendezVousBean rdvwithouttarger =iRendezVous.createRendezvous(iRendezVousTransformation.fromRendezvousToRendezvousBean(rendezVous));
        RendezVous rdvwithSOURCE = iRendezVousTransformation.fromRendezvousBeanToRendezvous(iRendezVous.InsertLikerToRDV(utilisateurBean,rdvwithouttarger.getIdRdv()));
        return rdvwithSOURCE;
    }

    @Override
    public RendezVous AddTargetToRdv(String targer, int rendezVous) {
        UtilisateurBean utilisateurBean= iUsers.getUserDetails(targer);
        RendezVousBean rdvwithtarget =iRendezVous.InsertTargetToLikerRDV(utilisateurBean,rendezVous);
        return iRendezVousTransformation.fromRendezvousBeanToRendezvous(rdvwithtarget);
    }

    @Override
    public RendezVous updateRDV(int rendezVous, Date date) {
        return iRendezVousTransformation.fromRendezvousBeanToRendezvous(iRendezVous.UpdateDateRdv(rendezVous,date));
    }

    @Override
    public List<RendezVous> GetListRdvUser(String user) {
        UtilisateurBean usernew=iUsers.getUserDetails(user);
        return iRendezVousTransformation.fromListeRendezvousBeanToListeRendezvous(iRendezVous.ConsulterUserRdv(usernew));
    }

    @Override
    public List<RendezVous> GetListRdv_REST(String restaurant) {
        return iRendezVousTransformation.fromListeRendezvousBeanToListeRendezvous(iRendezVous.ConsulterRdvParRestaurant(restaurant));
    }

    @Override
    public List<RendezVous> GetListRdvS() {
        return iRendezVousTransformation.fromListeRendezvousBeanToListeRendezvous(iRendezVous.ConsulterTousRdvs());
    }

    @Override
    public void DeleteRDV(int id) {
        iRendezVous.deleteRdv(id);
    }
}
