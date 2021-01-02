package main.java.com.jsu.servlet;

import main.java.com.jsu.bean.user;
import main.java.com.jsu.dao.userDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/adminChange")
public class adminChange extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        //获取前台提交的信息
        String id = req.getParameter("yz");
        String pas = req.getParameter("user-name2");

//        System.out.println(id);
//        System.out.println(pas);

        userDAO userDao = new userDAO();

        boolean m = userDao.updateAdminInfo(Integer.valueOf(id),pas);

        if (m){
            PrintWriter writer = resp.getWriter();
            writer.write("<script>");
            writer.write("alert('修改成功！');");
            writer.write("parent.location.href='/travel/adminServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
//            resp.sendRedirect("/travel/adminServlet");
        }else{
            System.out.println("假的");
        }
    }
}