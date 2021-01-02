package main.java.com.jsu.servlet;

import main.java.com.jsu.bean.user;
import main.java.com.jsu.dao.userDAO;

import javax.servlet.RequestDispatcher;
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

@WebServlet(urlPatterns = "/userRegisterServlet")
public class userRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的信息
        String userEmail = request.getParameter("email");
        String userPwd = request.getParameter("password");
        String userName = new String (request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
        String phone = request.getParameter("telephone");
        String gender = new String(request.getParameter("sex").getBytes("ISO-8859-1"),"UTF-8");
        String birthdaystr = request.getParameter("birthday");
        Date birthday = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthday = sdf.parse(birthdaystr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(userName);
        System.out.println(gender);
        //插入到数据库中，对数据进行封装，自己封装成一个对象
        user applicant = new user( null,  userName, userEmail,  userPwd,phone,gender,birthday);

        //保存applicant到数据库 userDAO
        userDAO applicantDAO = new userDAO();

        //判断是否有相同的email
        Integer count = applicantDAO.selectCount(userEmail);
        if(count>0){
            //数据库中已经有相同email的用户
            //通过response对象给客户端一个错误提示
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('申请注册的email已经被占用！');");
            writer.write("window.location.href='register.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }else {
            //flag是否注册成功
            boolean flag = applicantDAO.saveuser(applicant);

            if (flag){
                //注册成功就跳转到登录页面 重定向
                System.out.println("true");
                response.sendRedirect("/travel/login.jsp");
            }else{
                //注册失败就返回注册页面
                System.out.println("false");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/travel/register.jsp");
                dispatcher.forward(request,response);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost( request,  response);
    }
}
