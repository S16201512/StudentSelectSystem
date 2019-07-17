package com.nchu.dao;

import com.nchu.entity.Student;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SC_Dao {
    String tableName;
    public boolean delete_SC(String id,String Cno) {
        // 利用 jdbc 访问数据库
        Student student=new Student();
        tableName = " t_sc ";

        String SQL = "delete from "+tableName+"where Sno=? and Cno=?";


        return JDBCHelper.execute(SQL, id,Cno);






    }
    public boolean insert_SC(String id,String Cno ) {
        // 利用 jdbc 访问数据库
        String Tno=null;
        try {


            Student student = new Student();
            ResultSet rs = JDBCHelper.query("Select Tno from t_TC where Cno=?", Cno);
            while (rs.next()) {
                Tno = rs.getString("Tno");


            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        tableName = " t_sc(Sno,Cno,Tno) ";
        String SQL = "insert into "+tableName+"values(?,?,?)";
        /*System.out.println("id:"+id);
        System.out.println("Cno:"+Cno);*/


        return JDBCHelper.execute(SQL,id,Cno,Tno);






    }
}
