package com.nchu.dao;

import com.nchu.entity.Course;
import com.nchu.entity.Teacher;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 教师访问数据库
 */
public class TeacherDao {
    private String tableName = " t_teacher ";

    public List<Teacher> loadAll(){
        List<Teacher> teacherList = new ArrayList<Teacher>();

        ResultSet rs = JDBCHelper.query("select Tno, Tname , Tphone ,Tgender,Temail from " + tableName ) ;
        try{
            while( rs.next() ){
                Teacher t = new Teacher() ;
                t.setId( rs.getString( "Tno") );
                t.setUsername( rs.getString("Tname"));
                t.setGender( rs.getString( "Tgender"));
                t.setTphone( rs.getString("Tphone"));
                t.setTemail(rs.getString("Temail"));
                teacherList.add( t ) ;
            }
        }catch ( SQLException e ){
            e.printStackTrace();
        }

        return teacherList;
    }

    /**
     * 加载教师信息
     * @param id
     * @return
     */
    public Teacher loadById(String id){
        String SQL = " select Tno,Tpassword,Tname,Tgender,Tphone,Temail from " + tableName + " where Tno = ?";
        ResultSet rs = JDBCHelper.query(SQL,id);
        Teacher t = new Teacher();
        try{
            while (rs.next()){
                t.setId(rs.getString("Tno"));
                t.setPassword(rs.getString("Tpassword"));
                t.setGender(rs.getString("Tgender"));
                t.setUsername(rs.getString("Tname"));
                t.setTemail(rs.getString("Temail"));
                t.setTphone(rs.getString("Tphone"));
            }
        }catch ( SQLException e ){
            e.printStackTrace();
        }
        return t;
    }
}
