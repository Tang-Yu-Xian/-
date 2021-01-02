package main.java.com.jsu.servlet;

import main.java.com.jsu.bean.PageBean;
import main.java.com.jsu.bean.user;
import main.java.com.jsu.dao.CompanyDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/userPageServlet2")
public class userPageServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("searchBtn");

        //1、每页多少行 pageSize
        String pageSizeStr=request.getParameter("pageSize");
        Integer pageSize=null;//每页多少行
        if(pageSizeStr!=null&&pageSizeStr.length()>0){
            pageSize=Integer.valueOf(pageSizeStr);
        }else {
            pageSize=3;
        }

        //2、当前是第几页 currentPage
        String currentPageStr=request.getParameter("currentPage");
        Integer currentPage=null;//当前查询第几页
        if(currentPageStr!=null&&currentPageStr.length()>0){
            currentPage=Integer.valueOf(currentPageStr);
        }else {
            currentPage=1;
        }

        //3、一共有多少行 totalRows
        Integer totalRows=0;
        CompanyDao companyDao=new CompanyDao();

        String sqlCount="select count(*) from user where username =?";
        totalRows=companyDao.getCompanyCount(sqlCount,name);

        //5、起始行 startRow
        Integer startRow=(currentPage-1)*pageSize;

        StringBuffer sqlRow=new StringBuffer("SELECT \n" +
                "user.id id,\n" +
                "user.username name,\n" +
                "user.email email,\n" +
                "user.password pwd,\n" +
                "user.usertel telephone,\n" +
                "user.gender gender,\n" +
                "user.birthday birthday\n" +
                "from \n" +
                "user where username =?");
        sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
        System.out.println(sqlRow.toString());

        List<user> companyList= companyDao.getCompanyListByPage2(sqlRow.toString(),name);

        System.out.println(companyList);

        PageBean pageBean=new PageBean( currentPage,  pageSize,    totalRows,   companyList);
        request.setAttribute("pageBean",pageBean);

        request.getRequestDispatcher("user.jsp").forward(request,response);

    }
}
