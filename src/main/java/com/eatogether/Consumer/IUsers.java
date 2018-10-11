package com.eatogether.Consumer;

import com.eatogether.Repository.RepositoryBean.UserBean;
import com.eatogether.Repository.UtilisateurPersistance;

public interface IUsers {

    public void persistuser(UtilisateurPersistance user);
    public void deleteUser(UtilisateurPersistance user);
    public UtilisateurPersistance getUserDetails(String mail);
    public UtilisateurPersistance updateUserInformations(UtilisateurPersistance user);

}
