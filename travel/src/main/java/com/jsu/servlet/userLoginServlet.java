package main.java.com.jsu.servlet;

import main.java.com.jsu.bean.user;
import main.java.com.jsu.dao.userDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/userLoginServlet")
public class userLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet( request,  response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的email和密码
        String userEmail = request.getParameter("email");
        String userPwd = request.getParameter("password");

//        System.out.println(userPwd);

        // 根据email和密码查询申请人
        userDAO applicantDAO = new userDAO();

        user applicant = applicantDAO.getuserByEmailAndPass(userEmail,userPwd);

//        System.out.println(applicant);
        //判断applicant == null，返回登录页面，不为空，就进入主页面
        if (applicant!=null){

            HttpSession session=request.getSession();

            //将登录用户对象保存到session
            session.setAttribute("User",applicant);

//            System.out.println(session.getAttribute("User"));

            response.sendRedirect("/travel/index.jsp");
        }else {
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('用户名或密码错误！');");
            writer.write("window.location.href='login.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
    }
}
