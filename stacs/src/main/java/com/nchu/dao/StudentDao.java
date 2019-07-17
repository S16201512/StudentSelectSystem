package com.nchu.dao;

import com.nchu.entity.Student;
import com.nchu.entity.Teacher;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {

    String tableName = " t_student ";

    public List<Student> loadAll(){
        List<Student> studentList = new ArrayList<Student>();

        ResultSet rs = JDBCHelper.query("select Sno, Sname ,Smail ,Sgender,Stele from " + tableName ) ;
        try{
            while( rs.next() ){
                Student t = new Student() ;
                t.setId( rs.getString( "Sno") );
                t.setUsername( rs.getString("Sname"));
                t.setGender( rs.getString( "Sgender"));
                t.setStele( rs.getString("Stele"));
                t.setSmail(rs.getString("Smail"));
                studentList.add( t ) ;
            }
        }catch ( SQLException e ){
            e.printStackTrace();
        }


        return studentList;
    }

}
