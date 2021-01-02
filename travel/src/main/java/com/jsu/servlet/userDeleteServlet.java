package main.java.com.jsu.servlet;

import main.java.com.jsu.dao.addDAO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(urlPatterns = "/userDeleteServlet")
public class userDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        //获取前台提交的信息
        String id = req.getParameter("dId");

        System.out.println(id);

        addDAO addDao = new addDAO();
        boolean flag = addDao.deleteUserInfo(Integer.valueOf(id));

//        System.out.println(flag);
        if (!flag){
            PrintWriter writer = resp.getWriter();
            writer.write("<script>");
            writer.write("alert('删除成功！');");
            writer.write("window.location.href='/travel/CompanyServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
    }
}