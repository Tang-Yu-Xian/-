package main.java.com.jsu.servlet;

import com.alibaba.fastjson.JSON;
import main.java.com.jsu.bean.scenic;
import main.java.com.jsu.bean.user;
import main.java.com.jsu.dao.scenicDAO;
import main.java.com.jsu.dao.userDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/userLoadServlet")
public class userLoadServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset = utf-8");
        String m = request.getParameter("rid");
//        System.out.println(m);
        PrintWriter out = response.getWriter();
        userDAO s = new userDAO();
        List<user> lists = s.userLoadForId(Integer.valueOf(m));
        String json = JSON.toJSONString(lists);
        System.out.println(json);
        out.print(json);
        out.flush();
        out.close();
    }
}
