package com.nchu.entity;

public class Select_class {
    private String Cno  ;
    private String Cname  ;
    private String Time_out  ;
    private Double Credit  ;
    private String Tname;
    private String select_Fail_msg=null;

    public String getSelect_Fail_msg() {
        return select_Fail_msg;
    }

    public void setSelect_Fail_msg(String select_Fail_msg) {
        this.select_Fail_msg = select_Fail_msg;
    }

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

    public String getTname() {
        return Tname;
    }

    public void setTname(String tname) {
        Tname = tname;
    }
}
