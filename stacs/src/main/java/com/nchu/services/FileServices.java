package com.nchu.services;

import com.nchu.dao.FileDao;
import com.nchu.entity.File;

import java.util.List;

public class FileServices {
    FileDao fileDao = new FileDao();

    public boolean addFile( String fileName){

        return fileDao.addFile(fileName);

    }

    public List<File> loadAllFileName(){

        return fileDao.loadAllFileName();

    }

    public boolean deleteFile(int fileNO){
        return fileDao.deleteFile(fileNO);
    }

    public String loadByFileNo(int fileNo){
        return fileDao.loadByFileNo(fileNo);
    }


}
