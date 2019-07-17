package com.nchu.services;

import com.nchu.dao.CourseTableDao;
import com.nchu.entity.CourseTable;

import java.util.List;

/**
 * 课程表服务
 */
public class CourseTableServices {
    CourseTableDao courseTableDao = new CourseTableDao();


    public List<CourseTable> loadByTnoSeW(String Tno, String semester, String week){
        return courseTableDao.loadByTnoSeW(Tno ,semester,week);
    }
}
