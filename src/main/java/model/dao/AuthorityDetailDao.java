/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.pojo.FormType;
import model.pojo.PetitionForm;
import model.pojo.StudentRequest;

/**
 *
 * @author SONY
 */
public interface AuthorityDetailDao {

    //get type of form
    public List<FormType> getListForm();

    /*
    get list of student request according to status 
    w = wait 
    s = suspend
     */
    public List<StudentRequest> getStudentRequests(String status);
    
    public List<PetitionForm> getPetitionFormRequest();
}
//Stage
//
