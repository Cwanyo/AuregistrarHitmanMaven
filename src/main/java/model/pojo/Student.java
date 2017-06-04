package model.pojo;
// Generated Jun 5, 2017 1:35:22 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Student generated by hbm2java
 */
public class Student  implements java.io.Serializable {


     private int id;
     private Faculty faculty;
     private Major major;
     private String email;
     private String firstName;
     private String lastName;
     private String address;
     private String phoneNumber;
     private String religion;
     private String nationality;
     private int credit;
     private float gpa;
     private Set petitionForms = new HashSet(0);
     private Set changeSectionForms = new HashSet(0);

    public Student() {
    }

	
    public Student(int id, Faculty faculty, Major major, String email, String firstName, String lastName, String address, String phoneNumber, int credit, float gpa) {
        this.id = id;
        this.faculty = faculty;
        this.major = major;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.credit = credit;
        this.gpa = gpa;
    }
    public Student(int id, Faculty faculty, Major major, String email, String firstName, String lastName, String address, String phoneNumber, String religion, String nationality, int credit, float gpa, Set petitionForms, Set changeSectionForms) {
       this.id = id;
       this.faculty = faculty;
       this.major = major;
       this.email = email;
       this.firstName = firstName;
       this.lastName = lastName;
       this.address = address;
       this.phoneNumber = phoneNumber;
       this.religion = religion;
       this.nationality = nationality;
       this.credit = credit;
       this.gpa = gpa;
       this.petitionForms = petitionForms;
       this.changeSectionForms = changeSectionForms;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Faculty getFaculty() {
        return this.faculty;
    }
    
    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }
    public Major getMajor() {
        return this.major;
    }
    
    public void setMajor(Major major) {
        this.major = major;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhoneNumber() {
        return this.phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getReligion() {
        return this.religion;
    }
    
    public void setReligion(String religion) {
        this.religion = religion;
    }
    public String getNationality() {
        return this.nationality;
    }
    
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }
    public int getCredit() {
        return this.credit;
    }
    
    public void setCredit(int credit) {
        this.credit = credit;
    }
    public float getGpa() {
        return this.gpa;
    }
    
    public void setGpa(float gpa) {
        this.gpa = gpa;
    }
    public Set getPetitionForms() {
        return this.petitionForms;
    }
    
    public void setPetitionForms(Set petitionForms) {
        this.petitionForms = petitionForms;
    }
    public Set getChangeSectionForms() {
        return this.changeSectionForms;
    }
    
    public void setChangeSectionForms(Set changeSectionForms) {
        this.changeSectionForms = changeSectionForms;
    }




}


