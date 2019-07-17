package com.nchu.dao;

import com.nchu.entity.Student;
import com.nchu.entity.Teacher;
import com.nchu.entity.User;
import com.nchu.utils.JDBCHelper;
import com.nchu.utils.StringHelper;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * DAO ： Data Access Object
 * 经常用于 访问数据库
 * 是 操作于 User表
 */
public class UserDao {
    String tableName = null ;
    String SQL = null;

    public User loadById(String id , String identity){
        // 利用 jdbc 访问数据库
        if(identity.equals("管理员")){
            tableName = " t_admin ";
            SQL = "select ano , apassword , aname , agender from"+tableName+"where ano = ? " ;
        } else {
            if(identity.equals("教师")){
                tableName = " t_teacher ";
                SQL = "select tno , tpassword , tname , tgender from"+tableName+"where tno = ? " ;
            } else {
                if(identity.equals("学生")){
                    tableName = " t_student ";
                    SQL = "select sno , spassword , sname , sgender from"+tableName+"where sno = ? " ;
                }
            }
        }
        ResultSet rs = JDBCHelper.query( SQL , id ) ;
        User u = wrap( rs , identity) ;
        return u ;
    }

    /**
     * 封装
     * @param rs
     * @param identity
     * @return
     */
    private User wrap( ResultSet rs , String identity){
        User u = null ;
        if( rs != null ){
            try {
                if(identity.equals("管理员")){
                    while (rs.next()) {
                        u = new User();
                        u.setId(rs.getString("ano"));
                        u.setPassword(rs.getString("apassword"));
                        u.setUsername(rs.getString("aname"));
                        u.setGender(rs.getString("agender"));
                    }
                } else{
                    if(identity.equals("教师")){
                        while (rs.next()) {
                            u = new User();
                            u.setId(rs.getString("tno"));
                            u.setPassword(rs.getString("tpassword"));
                            u.setUsername(rs.getString("tname"));
                            u.setGender(rs.getString("tgender"));
                        }
                    } else{
                        while (rs.next()) {
                            u = new User();
                            u.setId(rs.getString("sno"));
                            u.setPassword(rs.getString("spassword"));
                            u.setUsername(rs.getString("sname"));
                            u.setGender(rs.getString("sgender"));
                        }
                    }
                }
            }catch( SQLException e){
                e.printStackTrace();
            }
        }
        return u ;
    }

    /**
     * 插入学生数据
     * @param arr
     * @return
     * @throws IOException
     */
    public boolean insertStudent(ArrayList<ArrayList<String>> arr) throws IOException {
        boolean flag = false;
        //后面的参数代表需要输出哪些列，参数个数可以任意
        String[] s = null;
        String sql = null;
        for(int i=0;i<arr.size();i++){
            ArrayList<String> row=arr.get(i);
            //定义字符数组接收每一行的数据
            s = new String[4];
            sql = "insert into t_Student(sno,spassword,sname,sgender) values( ? , md5(?) , ? , ? )";
            for(int j=0;j<row.size();j++){
                s[j]=row.get(j);
            }
            if(JDBCHelper.execute(sql,s)){
                flag = true;
            }
        }
        return flag;
    }

    /**
     * 插入数据
     * @param u
     * @return
     */
    public boolean  insertTeacher(Teacher u , String identity){
        if(identity.equals("管理员")){
            tableName = " t_admin ";
        } else {
            if(identity.equals("教师")){
                tableName = " t_teacher ";
            }
        }
        String SQL = "insert into " +tableName + " values ( ?  , ? , ? ,? ,?,? ) " ;
        return JDBCHelper.execute( SQL , u.getId()  , StringHelper.encrypt(u.getPassword()) ,
                u.getUsername() , u.getGender() ,u.getTphone(),u.getTemail()) ;
    }
    /**
     * 插入数据
     * @param u
     * @return
     */
    public boolean  insertStudent(Student u , String identity){
        if(identity.equals("管理员")){
            tableName = " t_admin ";
        } else {
                if(identity.equals("学生")){
                    tableName = " t_student ";
                }
            }
        String SQL = "insert into " +tableName + " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )" ;
        return JDBCHelper.execute( SQL , u.getId()  , StringHelper.encrypt(u.getPassword()) ,
                u.getUsername() , u.getGender() ,u.getSmail(),u.getSidentityNo(),u.getStele(),
                u.getSdorm(),u.getSdept(),u.getSidentity(),u.getSbirth()) ;
    }

    /**
     * 删除数据
     * @param u
     * @return
     */
    public boolean  deleteUser( User u ,String identity){
        if(identity.equals("管理员")){
            tableName = " t_admin ";
            SQL = "delete from"+tableName+"where ano = ? ";
        } else {
            if(identity.equals("教师")){
                tableName = " t_teacher ";
                SQL = "delete from"+tableName+"where tno = ? ";
            } else {
                if(identity.equals("学生")){
                    tableName = " t_student ";
                    SQL = "delete from"+tableName+"where sno = ? ";
                }
            }
        }
        return JDBCHelper.execute( SQL , u.getId() ) ;
    }

    /**
     * 重置密码
     */
    public boolean resetPassword( User u, String identity){
        System.out.println(u);
        System.out.println(identity);
        if(identity.equals("管理员")){
            tableName = " t_admin ";
            SQL = "update" +tableName + "set Apassword = ? where ano = ? " ;
        } else {
            if(identity.equals("教师")){
                tableName = " t_teacher ";
                SQL = "update" +tableName + "set Tpassword = ? where tno = ? " ;
            } else {
                if(identity.equals("学生")){
                    tableName = " t_student ";
                    SQL = "update" +tableName + "set Spassword = ? where sno = ? " ;
                }
            }
        }

        return JDBCHelper.execute( SQL  , StringHelper.encrypt(u.getPassword()) ,u.getId());

    }
}
