package main.java.com.jsu.dao;

import main.java.com.jsu.bean.user;
import main.java.com.jsu.utils.DBUtils;

import java.util.List;

public class CompanyDao {

    //分页查询
    public List<user> getCompanyListByPage(String sql) {

        List<user> companyList= DBUtils.getList(user.class,sql);
        return companyList;
    }
    //分页查询
    public List<user> getCompanyListByPage2(String sql,String name) {

        List<user> companyList= DBUtils.getList(user.class,sql,name);
        return companyList;
    }

    //查询一共有多少行
    public Integer getCompanyCount(String sql, Object...param) {

        Integer count=DBUtils.getCount(sql,param);
        return count;

    }
}