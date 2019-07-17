package com.nchu.entity;

public class Teacher extends User{
    private String Tphone;
    private String Temail;

    public String getTphone() {
        return Tphone;
    }

    public void setTphone(String tphone) {
        Tphone = tphone;
    }

    public String getTemail() {
        return Temail;
    }

    public void setTemail(String temail) {
        Temail = temail;
    }

}
