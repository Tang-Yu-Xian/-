package main.java.com.jsu.bean;

public class admin {
    private Integer id;
    private String adname;
    private String adpassword;

    public admin() {
    }

    public admin(Integer id, String adname, String adpassword) {
        this.id=id;
        this.adname = adname;
        this.adpassword = adpassword;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname;
    }

    public String getAdpassword() {
        return adpassword;
    }

    public void setAdpassword(String adpassword) {
        this.adpassword = adpassword;
    }

    @Override
    public String toString() {
        return "admin{" +
                "id=" + id +
                ", adname='" + adname + '\'' +
                ", adpassword='" + adpassword + '\'' +
                '}';
    }
}
