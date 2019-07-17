package com.nchu.dao;

import com.nchu.entity.Class_Arrange_Stu;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;

public class Class_Arrange_Stu_Dao {
    String tableName1="  t_Arrange_Student ";
    String tableName2=" t_Course ";
    String tableName3=" t_Teacher ";
    String tableName4=" t_sc ";
    String tableName5=" t_tc ";
    public List<Class_Arrange_Stu> loadAll(String XueNian,  String Num) {
        List<Class_Arrange_Stu> class_Arrange_Student_List = new ArrayList<>();


        String SQL = "select Kdate  , t_Arrange_Student.Sno , KworkDay, Kno ,Cname ,Tname , RoomNo "+
                "from " + tableName1+","+tableName2+
                ","+tableName3+","+tableName4+","+tableName5+
                "where t_Arrange_Student.Cno= t_sc.Cno and Kdate=? and t_Arrange_Student.Sno=?"+
                " and "+
                " t_Course.Cno=t_sc.Cno and t_TC.Cno=t_Arrange_Student.Cno and t_TC.Tno=t_teacher.Tno ";


        ResultSet rs = JDBCHelper.query(SQL,XueNian,Num);
        try {
            while (rs.next()) {
                int i=1;
                System.out.println(i);
                i++;
                Class_Arrange_Stu c = new Class_Arrange_Stu();
                c.setSno(rs.getString("t_Arrange_Student.Sno"));
                c.setTname(rs.getString("Tname"));
                c.setRoomNo(rs.getString("RoomNo"));
                c.setCname(rs.getString("Cname"));
                c.setKdate(rs.getString("Kdate"));
                c.setKno(rs.getString("Kno"));
                System.out.println(rs.getString("KworkDay"));
                if(rs.getString("KworkDay").equals("星期一")){
                    c.setKworkDay("1");
                    System.out.println("qqqqqqqqqqqqq"+c.getKworkDay());
                }else if(rs.getString("KworkDay").equals("星期二")){
                    c.setKworkDay("2");
                    System.out.println("hhhhhhhhhhhhhh"+c.getKworkDay());
                }else if(rs.getString("KworkDay").equals("星期三")){
                    c.setKworkDay("3");
                    System.out.println("wwwwwwwwwwwwwwwww"+c.getKworkDay());
                }else if(rs.getString("KworkDay").equals("星期四")){
                    c.setKworkDay("4");
                    System.out.println("eeeeeeeeeeeee"+c.getKworkDay());
                }else if(rs.getString("KworkDay").equals("星期五")){
                    c.setKworkDay("5");
                    System.out.println("rrrrrrrrrrrrrrrr"+c.getKworkDay());
                }




                class_Arrange_Student_List.add(c);
            }
            for(Class_Arrange_Stu a: class_Arrange_Student_List){
                System.out.println("kkkkkkkk"+a.getCname());

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return class_Arrange_Student_List;
    }
}
