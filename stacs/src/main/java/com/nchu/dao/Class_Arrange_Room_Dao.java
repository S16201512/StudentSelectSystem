package com.nchu.dao;

import com.nchu.entity.Class_Arrange_Room;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Class_Arrange_Room_Dao {
    String tableName1=" t_Arrange_Room ";
    String tableName2=" t_Course ";
    String tableName3=" t_Teacher ";
    String tableName4=" t_sc ";
    String tableName5=" t_tc ";


    public List<Class_Arrange_Room> loadAll(String XueNian,  String Num) {
        List<Class_Arrange_Room> class_Arrange_room_List = new ArrayList<>();

        String SQL = "select Kdate  , RoomNo   , KworkDay  , Kno ,Cname,Tname  from " + tableName1+","
                +tableName2+
                ","+tableName3+","+tableName4+","+tableName5+
                "where t_Arrange_Room.Cno= t_SC.Cno and Kdate=? and RoomNo =?"+"and"+
                " t_Course.Cno=t_SC.Cno and t_Tc.Tno=t_Teacher.Tno and t_Tc.cno =t_Arrange_Room.Cno ";


        ResultSet rs = JDBCHelper.query(SQL,XueNian,Num);
        try {
            while (rs.next()) {
                Class_Arrange_Room c = new Class_Arrange_Room();
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



                class_Arrange_room_List.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return class_Arrange_room_List;
    }
}
