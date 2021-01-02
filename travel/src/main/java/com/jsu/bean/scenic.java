package main.java.com.jsu.bean;

public class scenic {
    private Integer id;
    private String scenic_name;
    private String place;
    private String photo;
    private String show;
    private Double price;


    public scenic() {
    }

    public scenic(Integer id, String scenic_name, String place, String photo, String show, Double price) {
        this.id = id;
        this.scenic_name = scenic_name;
        this.place = place;
        this.photo = photo;
        this.show = show;
        this.price = price;

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getScenic_name() {
        return scenic_name;
    }

    public void setScenic_name(String scenic_name) {
        this.scenic_name = scenic_name;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getShow() {
        return show;
    }

    public void setShow(String show) {
        this.show = show;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }


    @Override
    public String toString() {
        return "scenic{" +
                "id=" + id +
                ", scenic_name='" + scenic_name + '\'' +
                ", place='" + place + '\'' +
                ", photo='" + photo + '\'' +
                ", show='" + show + '\'' +
                ", price=" + price +
                '}';
    }
}
