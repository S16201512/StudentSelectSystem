package com.nchu.dao;

import com.nchu.entity.File;
import com.nchu.entity.Student;
import com.nchu.utils.JDBCHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileDao {

    String tableName = " filetable(filename) ";

    public boolean addFile(String fileName) {
        // 利用 jdbc 访问数据库

        String SQL = "insert into "+tableName+ "value(?)";


        return JDBCHelper.execute(SQL, fileName);

    }
    public boolean deleteFile(int fileNo) {
        // 利用 jdbc 访问数据库

        String SQL = "delete from filetable where fileNo = ?";


        return JDBCHelper.execute(SQL, fileNo);

    }


    public List<File> loadAllFileName() {
        // 利用 jdbc 访问数据库

        String SQL = "select fileno,filename from filetable";

        List<File> fileList = new ArrayList<>();
        ResultSet rs =  JDBCHelper.query(SQL);

        try {
            while(rs.next()){
                File f = new File();
                f.setFileNO(rs.getInt("fileno"));
                f.setFileName(rs.getString("filename"));
                fileList.add(f);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fileList;
    }
    public String loadByFileNo(int fileNo){
        String fileName = null;

        String SQL = "select filename from filetable where fileNo = ?";

        ResultSet rs = JDBCHelper.query(SQL,fileNo);
        try {
            while (rs.next()){
                fileName = rs.getString("filename");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fileName;
    }

}
