/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.pojo.Authority;
import model.pojo.Student;

/**
 *
 * @author C.wan_yo
 */
public interface LoginDao {
    
    public Student loginStudent(String email);
    public Authority loginAuthority(String email);
    
}
