package com.eatogether.Consumer.Test;

import com.eatogether.Consumer.IRendezVous;
import com.eatogether.Consumer.IUsers;
import com.eatogether.Consumer.Implemenation.RendezVousImplementation;
import com.eatogether.Consumer.Implemenation.UsersImplementation;
import com.eatogether.Consumer.Transformation.IRendezVousTransformation;
import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Consumer.Transformation.Implementation.TransformationRdv;
import com.eatogether.Consumer.Transformation.Implementation.TransformationUser;
import com.eatogether.Repository.RendezVous;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;
import com.eatogether.Repository.User;
import org.junit.jupiter.api.Test;

import javax.jws.soap.SOAPBinding;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.Date;

public class RendezVousImplementationTest {
    IRendezVous iRendezVous = new RendezVousImplementation();
    IRendezVousTransformation iRendezVousTransformation = new TransformationRdv();
    private IUsers iUsers = new UsersImplementation();
    IUserTransformation iUserTransformation = new TransformationUser();



    @Test
    public void TestGetRdvs()
    {
        ArrayList<RendezVous> listerdvs = new ArrayList<>();

        Date d= new Date();
        d.setTime(10000);
        User user = new User();
        user.setNom("hello");
        user.setPrenom("darinetestj");
        user.setPseudo("coucu");
        user.setMail("theyri.darine01@gmail.com");
        user.setDatenaissance(d);
        user.setMotdepasse("1525425");
        UtilisateurBean utilisateurPersistance = iUserTransformation.fromUserToUserBean(user);
        iUsers.persistuser(utilisateurPersistance);
       listerdvs  = iRendezVousTransformation.fromListeRendezvousBeanToListeRendezvous(iRendezVous.ConsulterRdv(utilisateurPersistance));

        System.out.println(listerdvs.size());
    }
}
