package main.java.com.jsu.dao;

import main.java.com.jsu.bean.scenic;
import main.java.com.jsu.utils.DBUtils;

public class addDAO {

    public boolean saveScenicInfo(scenic basic) {

        String sql = "insert into scenic(scenic_name,place,photo,scenic.show,price)" +
                "values(?,?,?,?,?)";

        return DBUtils.save(sql,basic.getScenic_name(),basic.getPlace(),basic.getPhoto(),basic.getShow(),basic.getPrice());
    }

    public boolean deleteScenicInfo(Integer id) {

        String sql = "delete from scenic where id =?";

        return DBUtils.delete(sql,id);
    }

    public boolean deleteUserInfo(Integer id) {

        String sql = "delete from user where id =?";

        return DBUtils.delete(sql,id);
    }


    public boolean updateScenicInfo(scenic scenicInfo) {
        String sql = "update scenic set \n" +
                "\tscenic_name = ?, \n" +
                "\tplace = ?, \n" +
                "\tphoto = ?, \n" +
                "\tscenic.show = ?, \n" +
                "\tprice = ? \n" +
                "\twhere id = ?";
        boolean flag = DBUtils.update(sql,scenicInfo.getScenic_name(),scenicInfo.getPlace(),scenicInfo.getPhoto(),scenicInfo.getShow(),scenicInfo.getPrice(),scenicInfo.getId());
        return flag;
    }
}
