package main.java.com.jsu.bean;

import java.util.Date;

public class user {
    private Integer id;
    private String name;
    private String email;
    private String pwd;
    private String telephone;
    private String gender;
    private Date birthday;

    public user(){}
    public user(Integer userId,String name, String userEmail, String userPwd,String telephone,String gender,Date birthday) {
        this.id = userId;
        this.email = userEmail;
        this.name=name;
        this.pwd = userPwd;
        this.birthday = birthday;
        this.telephone=telephone;
        this.gender=gender;
    }
//    public user(Integer userId,String name, String userEmail, String userPwd,String telephone, String gender) {
//        this.id = userId;
//        this.email = userEmail;
//        this.name=name;
//        this.pwd = userPwd;
//        this.telephone=telephone;
//        this.gender=gender;
//    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "user{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", telephone='" + telephone + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                '}';
    }
}
