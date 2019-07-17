package com.nchu.dao;

import com.nchu.entity.Course;
import com.nchu.entity.Select_class;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDao {

    private String tableName = " t_course " ;


    public boolean deleteByCno(String Cno){
        String SQL = "delete from " + tableName  + " where Cno  = ?";
        return JDBCHelper.execute(SQL,Cno);
    }

    /**
     * 获取所有的课程
     *
     * @return 课程对象组成的集合
     */
    public List<Select_class> loadAll1() {
        List<Select_class> courseList = new ArrayList<>();
        String SQL = "select t_Course.Cno , Cname  , Time_out  , Credit ,Tname  from " + tableName+
                ", t_TC ,t_teacher  where t_course.Cno=t_TC.Cno and t_TC.Tno=t_teacher.Tno";



        ResultSet rs = JDBCHelper.query(SQL);
        try {

            while (rs.next()) {
                Select_class c = new Select_class();
                c.setCno(rs.getString("Cno"));
                c.setCname(rs.getString("Cname"));
                c.setTime_out(rs.getString("Time_out"));
                c.setCredit((Double)rs.getObject("Credit"));
                c.setTname(rs.getString("Tname"));




                courseList.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseList;
    }
    public List<Select_class> loadAll(String Sno) {
        List<Select_class> courseList = new ArrayList<>();
        String SQL = "select t_Course.Cno , Cname  , Time_out  , Credit ,Tname  from t_course"+
                "  , t_sc ,t_TC,t_teacher  where t_sc.Cno=t_TC.Cno and t_TC.Tno=t_teacher.Tno and"+
                "  t_sc.Cno=t_Course.Cno and t_sc.Sno=?";



        ResultSet rs = JDBCHelper.query(SQL,Sno);
        try {

            while (rs.next()) {
                Select_class c = new Select_class();
                c.setCno(rs.getString("Cno"));
                c.setCname(rs.getString("Cname"));
                c.setTime_out(rs.getString("Time_out"));
                c.setCredit((Double)rs.getObject("Credit"));
                c.setTname(rs.getString("Tname"));




                courseList.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseList;
    }


    /**
     * 获取所有的课程
     * @return 课程对象组成的集合
     */
    public List<Course> loadAll(){
        List<Course> courseList = new ArrayList<>() ;
        ResultSet rs = JDBCHelper.query("select Cno, Cname , Time_out , Credit from " + tableName ) ;
        try{
            while( rs.next() ){
                Course c = new Course() ;
                c.setCno( rs.getString( "Cno") );
                c.setCname( rs.getString("Cname"));
                c.setTime_out( rs.getString( "Time_out"));
                c.setCredit( rs.getDouble("Credit"));
                courseList.add( c ) ;
            }
        }catch ( SQLException e ){
            e.printStackTrace();
        }
        return courseList ;
    }

    /**
     * 获取所有的课程
     * @return 课程对象组成的集合
     */

    /**
     * 根据id 加载 Course 信息
     */
    public Course loadByCno(String Cno) {
        String SQL = "select Cno,Cname,Time_out,Credit,Cintroduction from" + tableName + "where Cno = ? ";
        ResultSet rs = JDBCHelper.query( SQL, Cno ) ;
        Course c = null ;
        try{
            while(rs.next()){
                c = new Course() ;
                c.setCno( rs.getString( "Cno") );
                c.setCname( rs.getString("Cname"));
                c.setTime_out( rs.getString( "Time_out"));
                c.setCredit( rs.getDouble("Credit"));
                c.setCintroduction(rs.getString("Cintroduction"));
            }
        }catch ( SQLException e ){
            e.printStackTrace();
        }
        return c  ;
    }

    /**
     * 更新课程
     * @param c
     * @return
     */
    public boolean update(Course c){
        String SQL = "update " + tableName + " set Cname = ? ,Time_out = ?,Credit = ? where Cno = ?";
        return JDBCHelper.execute(SQL,c.getCname(),c.getTime_out(),c.getCredit(),c.getCno());
    }

    /**
     *增加课程
     */
    public boolean add(Course c){
        String SQL = "insert into " + tableName + "values( ?,?,?,?,?)";
        boolean b = JDBCHelper.execute(SQL,c.getCno(),c.getCname(),c.getTime_out(),c.getCredit(),c.getCintroduction());
        return b;
    }
}
