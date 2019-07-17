package com.nchu.dao;

import com.nchu.entity.Class_Arrange_Class;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Class_Arrange_Class_Dao {
    String tableName1=" t_Arrange_class ";
    String tableName2=" t_Course ";
    String tableName3=" t_Teacher ";
        String tableName4="  t_SC ";

    public List<Class_Arrange_Class> loadAll(String XueNian,  String Num) {
        List<Class_Arrange_Class> class_Arrange_Class_List = new ArrayList<>();
        System.out.println("XueNian"+XueNian+"Num"+Num);

        String SQL = "select Kdate , ClassNo  , KworkDay ,Kno ,Cname,Tname,RoomNo  from " + tableName1+","
                +tableName2+","+tableName3+","+tableName4+
                "where t_Arrange_class.Cno= t_SC.Cno and Kdate=? and ClassNo=?" +"and"+
                " t_Course.Cno=t_SC.Cno and t_SC.Tno=t_Teacher.Tno";


        ResultSet rs = JDBCHelper.query(SQL,XueNian,Num);
        try {
            while (rs.next()) {

                Class_Arrange_Class c = new Class_Arrange_Class();
                c.setClassNo(rs.getString("ClassNo"));

                c.setRoomNo(rs.getString("RoomNo"));
                c.setTname(rs.getString("Tname"));

                c.setCname(rs.getString("Cname"));
                c.setKdate(rs.getString("Kdate"));
                c.setKno(rs.getString("Kno"));
                if(rs.getString("KworkDay").equals("星期一")){
                    c.setKworkDay("1");
                }else if(rs.getString("KworkDay").equals("星期二")){
                    c.setKworkDay("2");
                }else if(rs.getString("KworkDay").equals("星期三")){
                    c.setKworkDay("3");
                }else if(rs.getString("KworkDay").equals("星期四")){
                    c.setKworkDay("4");
                }else if(rs.getString("KworkDay").equals("星期五")){
                    c.setKworkDay("5");
                }





                class_Arrange_Class_List.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return class_Arrange_Class_List;
    }
}
