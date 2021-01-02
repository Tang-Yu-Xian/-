package main.java.com.jsu.servlet;

import com.alibaba.fastjson.JSON;
import main.java.com.jsu.bean.scenic;
import main.java.com.jsu.dao.scenicDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/detailServlet")
public class detailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset = utf-8");
        String m = request.getParameter("rid");
        PrintWriter out = response.getWriter();
        scenicDAO s = new scenicDAO();
        List<scenic> lists = s.scenicLoadForId(Integer.valueOf(m));
        String json = JSON.toJSONString(lists);
        out.print(json);
        out.flush();
        out.close();
    }
}
