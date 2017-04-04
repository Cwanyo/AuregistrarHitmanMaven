package model.pojo;
// Generated Apr 4, 2017 8:17:45 PM by Hibernate Tools 4.3.1



/**
 * StudentRequest generated by hbm2java
 */
public class StudentRequest  implements java.io.Serializable {


     private StudentRequestId id;
     private FormType formType;
     private Student student;
     private int currentStage;
     private String status;
     private PetitionForm petitionForm;

    public StudentRequest() {
    }

	
    public StudentRequest(StudentRequestId id, FormType formType, Student student, int currentStage, String status) {
        this.id = id;
        this.formType = formType;
        this.student = student;
        this.currentStage = currentStage;
        this.status = status;
    }
    public StudentRequest(StudentRequestId id, FormType formType, Student student, int currentStage, String status, PetitionForm petitionForm) {
       this.id = id;
       this.formType = formType;
       this.student = student;
       this.currentStage = currentStage;
       this.status = status;
       this.petitionForm = petitionForm;
    }
   
    public StudentRequestId getId() {
        return this.id;
    }
    
    public void setId(StudentRequestId id) {
        this.id = id;
    }
    public FormType getFormType() {
        return this.formType;
    }
    
    public void setFormType(FormType formType) {
        this.formType = formType;
    }
    public Student getStudent() {
        return this.student;
    }
    
    public void setStudent(Student student) {
        this.student = student;
    }
    public int getCurrentStage() {
        return this.currentStage;
    }
    
    public void setCurrentStage(int currentStage) {
        this.currentStage = currentStage;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public PetitionForm getPetitionForm() {
        return this.petitionForm;
    }
    
    public void setPetitionForm(PetitionForm petitionForm) {
        this.petitionForm = petitionForm;
    }




}


