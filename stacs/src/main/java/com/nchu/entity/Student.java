package com.nchu.entity;

public class Student extends User {
    private String Smail  ;
    private String SidentityNo;
    private String Stele;
    private String Sdorm;
    private String Sdept;
    private String Sidentity;
    private String Sbirth   ;

    public String getSmail() {
        return Smail;
    }

    public void setSmail(String smail) {
        Smail = smail;
    }

    public String getSidentityNo() {
        return SidentityNo;
    }

    public void setSidentityNo(String sidentityNo) {
        SidentityNo = sidentityNo;
    }

    public String getStele() {
        return Stele;
    }

    public void setStele(String stele) {
        Stele = stele;
    }

    public String getSdorm() {
        return Sdorm;
    }

    public void setSdorm(String sdorm) {
        Sdorm = sdorm;
    }

    public String getSdept() {
        return Sdept;
    }

    public void setSdept(String sdept) {
        Sdept = sdept;
    }

    public String getSidentity() {
        return Sidentity;
    }

    public void setSidentity(String sidentity) {
        Sidentity = sidentity;
    }

    public String getSbirth() {
        return Sbirth;
    }

    public void setSbirth(String sbirth) {
        Sbirth = sbirth;
    }


}
