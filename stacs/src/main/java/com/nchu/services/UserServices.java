package com.nchu.services;

import com.nchu.dao.StuDao;
import com.nchu.dao.UserDao;
import com.nchu.entity.Student;
import com.nchu.entity.Teacher;
import com.nchu.entity.User;
import com.nchu.utils.StringHelper;

/**
 * 这个类，是针对于 User 进行提供服务的类
 * 经常是用于处理各种业务
 */
public class UserServices {
    StuDao stuDao = new StuDao() ;
    UserDao userDao = new UserDao() ;

    /**
     * 根据学工号和密码检查是否存在这个用户
     * @param id
     * @param password
     * @return true 表示存在，false 表示不存在
     */
    public boolean load( String id , String password , String identity){
        User u = userDao.loadById( id , identity) ;
        if( u != null ){
            // 验证密码
            String userPassword = u.getPassword();
            // 判断两次密码是否相等
            if( userPassword.equals( StringHelper.encrypt( password ) ) ){
                return true ;
            }
        }
        return false ;
    }

    public boolean isUnique(String userid,String identity){
        // 拿到 userid 去数据库中查询 ，如果有 ，证明 不可以添加， 返回 false
        User u = userDao.loadById( userid ,identity ) ;
        if( u != null ){
            return false ;
        }
        // 如果没有呢？ 返回 true
        return true ;
    }

    public Student load(String id){
        Student u = stuDao.loadById( id) ;

        return u ;
    }

    /**
     * 增加用户的方法
     */
    public boolean addTeacher(Teacher teacher, String id , String password , String username , String gender , String identity){
        teacher.setId(id);
        teacher.setPassword(password);
        teacher.setUsername(username);
        teacher.setGender( gender );
        return userDao.insertTeacher( teacher , identity) ;
    }
    /**
     * 增加学生的方法
     */
    public boolean addStudent(Student student,String id , String password , String username , String gender , String identity){
        student.setId(id);
        student.setPassword(password);
        student.setUsername(username);
        student.setGender( gender );
        return userDao.insertStudent( student , identity) ;
    }

    /**
     * 删除用户的方法
     */
    public boolean subUser( String id ,String identity){
        User u = new User() ;
        u.setId(id);
        return userDao.deleteUser( u , identity) ;
    }

    /**
     * 重置密码
     */
    public boolean reset(String id,String newPassword,String identity){
        User u = new User() ;
        u.setId(id);
        u.setPassword(newPassword);

        return userDao.resetPassword( u , identity) ;
    }
}
