package com.nchu.services;

import com.nchu.dao.TeacherDao;
import com.nchu.entity.Teacher;

import java.util.List;

/**
 * 教师服务
 */
public class TeacherServices {
    TeacherDao teacherDao = new TeacherDao();


    /**
     * 根据教师编号加载教师信息
     * @param id
     * @return
     */
    public Teacher loadById(String id){
        return teacherDao.loadById(id);
    }

    public List<Teacher> loadAll(){
        return teacherDao.loadAll();
    }

}
