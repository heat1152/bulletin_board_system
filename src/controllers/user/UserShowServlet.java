package controllers.user;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;


@WebServlet("/user/show")
public class UserShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public UserShowServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");
        User u = em.find(User.class, Integer.parseInt(request.getParameter("id")));

        em.close();


        if(u.getId() == login_user.getId()){//取り出したユーザー情報がログインユーザー情報と一致した場合マイページへ
            request.setAttribute("user", u);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/myPage/show.jsp");
            rd.forward(request, response);

        }else{//取り出したユーザー情報がログインユーザー情報と一致しなかった場合ユーザー詳細へ
            request.setAttribute("user", u);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/show.jsp");
            rd.forward(request, response);
        }
    }

}
