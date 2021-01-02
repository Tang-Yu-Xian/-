package main.java.com.jsu.dao;

import main.java.com.jsu.bean.scenic;
import main.java.com.jsu.utils.DBUtils;

import java.util.List;

public class scenicDAO {

    public List<scenic> scenicLoad() {
        String sql = "select * from scenic";
        return DBUtils.LL(sql);
    }
    public List<scenic> scenicLoadForId(Integer x) {
        String sql = "select * from scenic where id =" + x;
        return DBUtils.LL(sql);
    }

}
