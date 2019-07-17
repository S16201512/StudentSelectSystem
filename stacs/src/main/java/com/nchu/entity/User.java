package com.nchu.entity;

/**
 * 这是一个实体类，用来表示一个用户，与之对应的数据库表中 的一条记录
 * 也就是说 在数据库中有一条记录，那么就表示成一个 User对象

 -- MySQL
 create table t_user(
 id varchar(40) primary key ,
 username varchar(30) ,
 password varchar(40) ,
 nickname varchar(150)
 );


 */
public class User {
    private String id ;
    private String password ;
    private String username ;
    private String gender;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
