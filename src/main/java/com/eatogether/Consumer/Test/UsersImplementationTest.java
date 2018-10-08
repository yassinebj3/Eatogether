package com.eatogether.Consumer.Test;

import com.eatogether.Consumer.IUsers;
import com.eatogether.Consumer.Implemenation.UsersImplementation;
import com.eatogether.Consumer.Transformation.ITransformation;
import com.eatogether.Consumer.Transformation.TransformationUser;
import com.eatogether.Repository.RepositoryBean.UserBean;
import com.eatogether.Repository.UtilisateurPersistance;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UsersImplementationTest {
    private ITransformation iTransformation = new TransformationUser();
    private IUsers iUsers = new UsersImplementation();


    @Test
    public void TestSaveUser()
    {
        UserBean userBean = new UserBean();
        userBean.setNom("hello");
        UtilisateurPersistance utilisateurPersistance = iTransformation.fromUserBeanToUser(userBean);
        iUsers.persistuser(utilisateurPersistance);
    }


}