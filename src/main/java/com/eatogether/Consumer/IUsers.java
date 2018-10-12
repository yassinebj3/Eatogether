package com.eatogether.Consumer;

import com.eatogether.Repository.RepositoryBean.UtilisateurBean;

public interface IUsers {

    public void persistuser(UtilisateurBean user);
    public void deleteUser(UtilisateurBean user);
    public UtilisateurBean getUserDetails(String mail);
    public UtilisateurBean updateUserInformations(UtilisateurBean user);

}
