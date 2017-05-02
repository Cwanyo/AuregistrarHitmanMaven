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
 * @author pncht
 */
public interface StudentDetailDao {
    
    //get type of form
    public List<FormType> getListForm();
    
    /*
    type of status
    w = wait 
    s = suspend
     */
    //get petition form only
    public List<PetitionForm> getPetitionFormRequest(String status,String studentId);
    
    //get change section form only
    public List<ChangeSectionForm> getChangeSectionForm(String status,String studentId);
    
    //submit function
    public boolean SubmitPetitionForm(PetitionForm p);
    
    public boolean SubmitChangeSectionForm(ChangeSectionForm c);
    
}
