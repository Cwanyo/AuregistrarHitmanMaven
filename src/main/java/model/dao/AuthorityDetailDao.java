/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.pojo.ChangeSectionForm;
import model.pojo.FormType;
import model.pojo.PetitionForm;

/**
 *
 * @author SONY
 */
public interface AuthorityDetailDao {

    //get type of form
    public List<FormType> getListForm();

    /*
    type of status
    waiting 
    suspend
    approved
     */
    //get petition form only
    public List<PetitionForm> getPetitionFormRequest(String status);
    
    //get change section form only
    public List<ChangeSectionForm> getChangeSectionForm(String status);
    
    //get petition form only according to user role
    public List<PetitionForm> getPetitionFormsRequestForRole(String role, String status);
    
    //get change section form only according to user role
    public List<ChangeSectionForm> getChangeSectionFormForRole(String role, String status);
}
//Stage
//
