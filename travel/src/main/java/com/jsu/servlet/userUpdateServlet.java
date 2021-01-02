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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(urlPatterns = "/userUpdateServlet")
public class userUpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        //获取前台提交的信息
        String id = req.getParameter("Id");
        String name = new String (req.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
        String email = req.getParameter("email");
        String pas = req.getParameter("pas");
        String pho = req.getParameter("pho");
        String gen = new String (req.getParameter("gen").getBytes("ISO-8859-1"),"UTF-8");
        String bir = req.getParameter("bir");
        int flag = 0;

        Date birthday = null;
        if(bir==null){
            flag=1;
        }else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                birthday = sdf.parse(bir);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
//        System.out.println(birthday);
        user us  = new user(Integer.valueOf(id), name, email, pas, pho, gen, birthday);;
//        if (flag==1) {
//            us = new user(Integer.valueOf(id), name, email, pas, pho, gen, null);
//        }else{
//            us = new user(Integer.valueOf(id), name, email, pas, pho, gen, birthday);
//        }
        boolean m = true;
        userDAO userDao = new userDAO();
        if(flag==1){
            m = userDao.updateUserInfo2(us);
        }else {
            m = userDao.updateUserInfo(us);
        }

        if (m){
            PrintWriter writer = resp.getWriter();
            writer.write("<script>");
            writer.write("alert('修改成功！');");
            writer.write("window.location.href='/travel/userPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
    }
}