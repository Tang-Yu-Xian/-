package main.java.com.jsu.dao;

import main.java.com.jsu.bean.admin;
import main.java.com.jsu.bean.user;
import main.java.com.jsu.utils.DBUtils;

import java.util.List;

public class userDAO {

    //保存注册对象
    public boolean saveuser(user applicant) {
        String sql = "insert into user(username,email,password,usertel,gender,birthday)" +
                "values(?,?,?,?,?,?)";

       return DBUtils.save(sql,applicant.getName(),applicant.getEmail(),applicant.getPwd(),applicant.getTelephone(),applicant.getGender(),applicant.getBirthday());
    }

    // 根据email和密码查询用户
    public user getuserByEmailAndPass(String userEmail, String userPwd) {

        String sql = "select id,username name,email,user.password pwd,usertel telephone,gender,birthday from user where email=? and password=? ";
       return DBUtils.getSingleObj(user.class,sql,userEmail,userPwd);
    }
    // 根据用户和密码查询用户
    public admin getUserByNameAndPass(String name, String userPwd) {

        String sql = "select id,adname ,adpassword from administrator where adname=? and adpassword=? ";
        return DBUtils.getSingleObj(admin.class,sql,name,userPwd);
    }

    public Integer selectCount(String userEmail) {

        String sql = "select count(*) from user a where a.email = ?";
        Integer count = DBUtils.getCount(sql,userEmail);
        return count;
    }

    public List<user> userLoadForId(Integer x) {
        String sql = "select id,username name,email,user.password pwd,usertel telephone,gender,birthday from user where id =?";
        return DBUtils.getList(user.class,sql,x);
    }
    public boolean updateAdminInfo(Integer id,String pas) {
        String sql = "update administrator set \n" +
                "\tadpassword = ? \n" +
                "\twhere id = ?";
        boolean flag = DBUtils.update(sql,pas,id);
        return flag;
    }
    public boolean updateUserInfo(user userInfo) {
        String sql = "update user set \n" +
                "\tuser.username = ?, \n" +
                "\temail = ?, \n" +
                "\tuser.password = ?, \n" +
                "\tuser.usertel = ?, \n" +
                "\tgender = ?, \n" +
                "\tbirthday = ?\n" +
                "\twhere id = ?";
        boolean flag = DBUtils.update(sql,userInfo.getName(),userInfo.getEmail(),userInfo.getPwd(),userInfo.getTelephone(),userInfo.getGender(),userInfo.getBirthday(),userInfo.getId());
        return flag;
    }
    public boolean updateUserInfo2(user userInfo) {
        String sql = "update user set \n" +
                "\tusername = ?, \n" +
                "\temail = ?, \n" +
                "\tpassword = ?, \n" +
                "\tusertel = ?, \n" +
                "\tgender = ? \n" +
                "\twhere id = ?";
        boolean flag = DBUtils.update(sql,userInfo.getName(),userInfo.getEmail(),userInfo.getPwd(),userInfo.getTelephone(),userInfo.getGender(),userInfo.getBirthday(),userInfo.getId());
        return flag;
    }
}
