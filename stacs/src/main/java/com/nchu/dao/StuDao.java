package com.nchu.dao;

import com.nchu.entity.Student;
import com.nchu.entity.User;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * DAO ： Data Access Object
 * 经常用于 访问数据库
 * 是 操作于 User 那张表
 */
/*insert into t_Student(Sno,Spassword,Sname,Sgender) values('248862',md5('123'),'123','F')*/
public class StuDao {
    String tableName = " t_Student ";

    public User loadByUsername(String username) {
        // 利用 jdbc 访问数据库
        String SQL = "select id , username , password , nickname from" + tableName + "where username = ? ";
        ResultSet rs = JDBCHelper.query(SQL, username);
        User u = wrap(rs);
        return u;
    }

    /**
     * 插入数据
     *
     * @param u
     * @return
     */
    public boolean insert(User u) {
        String SQL = "insert into " + tableName + " values ( ?  , ? , ?  ) ";
        return JDBCHelper.execute(SQL, u.getId(), u.getUsername(), u.getPassword());
    }

    private User wrap(ResultSet rs) {
        User u = null;
        if (rs != null) {
            try {
                while (rs.next()) {
                    u = new User();
                    u.setId(rs.getString("id"));
                    u.setUsername(rs.getString("username"));
                    u.setPassword(rs.getString("password"));

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return u;
    }

    /**
     * 加载学生信息
     *
     * @param id
     * @param
     * @return
     */
    public Student loadById(String id) {
        // 利用 jdbc 访问数据库
        Student student=new Student();
        tableName = " t_student ";
        String SQL = "select sno , spassword , sname , sgender,Smail ,SidentityNo ,Stele , " +
                "Sdorm , Sdept ,   Sidentity  ,Sbirth from " + tableName + "where sno = ? ";

        try {
            ResultSet rs = JDBCHelper.query(SQL, id);

            while(rs.next()) {
                student.setId(rs.getString("sno"));
                student.setPassword(rs.getString("spassword"));
                student.setUsername(rs.getString("sname"));
                student.setGender(rs.getString("sgender"));
                student.setSbirth(rs.getString("Sbirth"));
                student.setSdept(rs.getString("Sdept"));
                student.setSdorm(rs.getString("Sdorm"));
                student.setSidentityNo(rs.getString("SidentityNo"));
                student.setSidentity(rs.getString("Sidentity"));
                student.setStele(rs.getString("Stele"));
                student.setSmail(rs.getString("Smail"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  student;



    }
}
