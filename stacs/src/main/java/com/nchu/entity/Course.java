package com.nchu.entity;

public class Course {
    private String Cno;
    private String Cname;
    private String Time_out;
    private double Credit;

    public void setCredit(double credit) {
        Credit = credit;
    }

    private String Cintroduction;

    public String getCno() {
        return Cno;
    }

    public void setCno(String cno) {
        Cno = cno;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public String getTime_out() {
        return Time_out;
    }

    public void setTime_out(String time_out) {
        Time_out = time_out;
    }

    public Double getCredit() {
        return Credit;
    }

    public void setCredit(Double credit) {
        Credit = credit;
    }

    public String getCintroduction() {
        return Cintroduction;
    }

    public void setCintroduction(String cintroduction) {
        Cintroduction = cintroduction;
    }
}
