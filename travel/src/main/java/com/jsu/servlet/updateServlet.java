package main.java.com.jsu.servlet;
import main.java.com.jsu.bean.scenic;
import main.java.com.jsu.dao.addDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

@WebServlet(urlPatterns = "/updateServlet")
public class updateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        //获取前台提交的信息
        String id = null;
        String scenicName = null;
        String city = null;
        String show = null;
        double price = 0;
        String photo = null;

//        System.out.println(id);

        String dir = this.getServletContext().getRealPath("/images");
        List<FileItem> list = null;
        //1 先判断上传的数据是否多段数据（只有是多段的数据，才是文件上传的）
        if (ServletFileUpload.isMultipartContent(req)) {
//           创建FileItemFactory工厂实现类
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            // 创建用于解析上传数据的工具类ServletFileUpload类
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
            try {
                // 解析上传的数据，得到每一个表单项FileItem
                list = servletFileUpload.parseRequest(req);
                // 循环判断，每一个表单项，是普通类型，还是上传的文件
                for (FileItem fileItem : list) {

                    if (fileItem.isFormField()) {
                        // 普通表单项
                        System.out.println("表单项的name属性值：" + fileItem.getFieldName());
                        // 参数UTF-8.解决乱码问题
                        System.out.println("表单项的value属性值：" + fileItem.getString("UTF-8"));

                    } else {
                        // 上传的文件
                        System.out.println("表单项的name属性值：" + fileItem.getFieldName());
                        System.out.println("上传的文件名：" + fileItem.getName());
                           photo = fileItem.getName();
                           File file = new File(dir + "/" + fileItem.getName());
                           if(file.exists()){

                           }else{
                               fileItem.write(file);
                           }
                       }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 获取表中的数据
        Iterator<FileItem> thisItem = list.iterator();
        while (thisItem.hasNext()) {
            FileItem thisItem2 = thisItem.next();
            String thisItemName = thisItem2.getFieldName();
            if (thisItem2.isFormField()) {
                if (thisItemName.equals("Id")) {
                    id = thisItem2.getString("utf-8");
//                    System.out.println(id);
                }else if (thisItemName.equals("name")) {
                    scenicName = thisItem2.getString("utf-8");
//                    System.out.println(name);
                } else if (thisItemName.equals("consumption")) {
                    price = Float.parseFloat(thisItem2.getString("utf-8"));
//                    System.out.println(price);
                } else if (thisItemName.equals("city")) {
                    city = thisItem2.getString("utf-8");
//                    System.out.println(introduce);
                } else if (thisItemName.equals("characteristic")) {
                    show = thisItem2.getString("utf-8");
//                    System.out.println(endTime);
                }
            }
        }
        System.out.println(id);
        scenic sc = new scenic(Integer.valueOf(id), scenicName, city, photo, show, price);
//        sc.setId(Integer.valueOf(id));
//        System.out.println(sc.getId());
        addDAO addDao = new addDAO();
        boolean flag = addDao.updateScenicInfo(sc);

        if (flag){
            PrintWriter writer = resp.getWriter();
            writer.write("<script>");
            writer.write("alert('修改成功！');");
            writer.write("window.location.href='Mscenic.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
    }
}