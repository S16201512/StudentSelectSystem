package com.nchu.services;

import com.nchu.dao.*;
import com.nchu.entity.*;

import java.util.List;

public class CourseServices {
    CourseDao cd = new CourseDao();
    Class_Arrange_Class_Dao CACD= new Class_Arrange_Class_Dao();
    Class_Arrange_Room_Dao CARD= new Class_Arrange_Room_Dao();
    Class_Arrange_Stu_Dao CASD= new Class_Arrange_Stu_Dao();
    SC_Dao scd=new SC_Dao();
    /**
     * 查询所有课程
     *
     * @return
     */
    public List<Select_class> loadAll1() {
        return cd.loadAll1();
    }

    public List<Select_class>  loadAll(String Sno){
        return  cd.loadAll(Sno);
    }

    /**
     * 根据id 加载课程信息
     */


    public List<Class_Arrange_Class> load_KeBiao1(String XueNian, String Num) {
        return CACD.loadAll(XueNian,Num);



    }
    public List<Class_Arrange_Room> load_KeBiao2(String XueNian, String Num) {

        return CARD.loadAll(XueNian,Num);



    }
    public List<Class_Arrange_Stu> load_KeBiao3(String XueNian, String Num) {

        return CASD.loadAll(XueNian,Num);



    }
    public boolean reback(String Sno,String courseNo){
        return scd.delete_SC(Sno,courseNo);

    }
    public boolean select1(String Sno,String courseNo){
        return scd.insert_SC(Sno,courseNo);

    }




    /**
     * 删除课程
     * @return
     */
    public boolean deleteByCno(String Cno){
        return cd.deleteByCno(Cno);
    }


    /**
     * 查询所有课程
     *
     * @return
     */
    public List<Course> loadAll() {
        return cd.loadAll();
    }

    /**
     * 根据Cno加载课程信息
     */
    public Course loadByCno(String Cno ) {
        return cd.loadByCno(Cno) ;
    }

    public boolean update(String Cno,String Cname,String Time_out,double Credit){
        Course c = new Course();
        c.setCno(Cno);
        c.setCname(Cname);
        c.setTime_out(Time_out);
        c.setCredit(Credit);
        return cd.update(c);
    }

    /**
     * 添加课程
     */
    public boolean add(String name, String Time_out, double Credit,String Cintroduction,String tno) {

        Course c = new Course();
        c.setCname(name);
        c.setCredit(Credit);
        c.setTime_out(Time_out);
        c.setCintroduction(Cintroduction);
        c.setCno(tno + name);
        //将教师编号以及课程编号插入教师课程匹配表
        t_TCDao t_tcDao = new t_TCDao();
        boolean b = t_tcDao.add(tno,c.getCno());
        if(b){
            System.out.println("插入教师课程匹配表成功!");
        }
        return cd.add(c);
    }

}
