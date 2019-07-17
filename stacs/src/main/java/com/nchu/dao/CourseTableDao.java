package com.nchu.dao;

import com.nchu.entity.CourseTable;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseTableDao {
    private String tableName = " t_A_T ";

    public List<CourseTable> loadByTnoSeW(String Tno,String semester,String week){

        String SQL = "select Kdate,Tno,Kno,KworkDay,Cno,Croom,Cweek from " + tableName + " where Tno = ? and Kdate = ? and Cweek = ?";
        List<CourseTable> courseTableList = new ArrayList<>() ;
        ResultSet rs = JDBCHelper.query( SQL, Tno,semester,week) ;

        CourseTable ct = null ;
        try{
            while(rs.next()){
                ct = new CourseTable() ;
                ct.setCno( rs.getString( "Cno") );
                ct.setCweek(rs.getString("Cweek"));
                ct.setTno( rs.getString("Tno"));
                ct.setKdate(rs.getString("Kdate"));
                ct.setKno( rs.getString("Kno"));
                ct.setKworkDay(rs.getString("KworkDay"));
                ct.setCroom(rs.getString("Croom"));
                courseTableList.add(ct);
            }
        }catch ( SQLException e ){
            e.printStackTrace();
        }
        return courseTableList ;
    }
}
