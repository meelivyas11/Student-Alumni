package com.studentAlumni.Domain;

import java.io.Serializable;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Meeli Vyas
 */
@SuppressWarnings("serial")
public class StudentofCollege implements Serializable{

    String grno;
    String firstname;
    String lastname;
    String gender;
    String birthdate;
    String addmission;
    String aggregate;
    String yearofPassing;
    String branch;

    public StudentofCollege() {
    }

    public String getAddmission() {
        return addmission;
    }

    public void setAddmission(String Addmission) {
        this.addmission = Addmission;
    }

    public String getAggregate() {
        return aggregate;
    }

    public void setAggregate(String Aggregate) {
        this.aggregate = Aggregate;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String Birthdate) {
        this.birthdate = Birthdate;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String Branch) {
        this.branch = Branch;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String Firstname) {
        this.firstname = Firstname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String Gender) {
        this.gender = Gender;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String Lastname) {
        this.lastname = Lastname;
    }

    public String getYearofPassing() {
        return yearofPassing;
    }

    public void setYearofPassing(String YearofPassing) {
        this.yearofPassing = YearofPassing;
    }

    public String getGrno() {
        return grno;
    }

    public void setGrno(String grno) {
        this.grno = grno;
    }


    



}
