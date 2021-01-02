package main.java.com.jsu.servlet;

import com.alibaba.druid.support.json.JSONUtils;
import main.java.com.jsu.dao.userDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");

        //获取前台提交的email
        String email=req.getParameter("email");

        PrintWriter pw=resp.getWriter();

        //保存applicant到数据库ApplicantDAO
        userDAO userDAO = new userDAO();

        //判断是否有相同的email
        Integer count = userDAO.selectCount(email);
        if (count > 0) {
            pw.print(false);

        } else {
            pw.print(true);
        }

        pw.flush();
        pw.close();

    }
}
