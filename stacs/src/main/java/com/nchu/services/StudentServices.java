package com.nchu.services;

import com.nchu.dao.StudentDao;
import com.nchu.entity.Student;

import java.util.ArrayList;
import java.util.List;

/**
 * 学生数据库服务
 */
public class StudentServices {
    StudentDao studentDao  = new StudentDao();

    public List<Student> loadAll(){
        return studentDao.loadAll();

    }


}
