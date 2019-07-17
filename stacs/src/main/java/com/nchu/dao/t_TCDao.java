package com.nchu.dao;

import com.nchu.utils.JDBCHelper;

/**
 * 教室课程匹配表数据库操作
 */
public class t_TCDao {
    String tableName = " t_TC ";

    public boolean add(String Tno,String Cno){
        String SQL = "insert into " + tableName + " values(?,?) " ;
        return JDBCHelper.execute(SQL,Tno,Cno);
    }

}
