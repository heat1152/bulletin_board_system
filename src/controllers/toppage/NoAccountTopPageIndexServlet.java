package controllers.toppage;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;


@WebServlet("/noAccountTopPage/index")
public class NoAccountTopPageIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public NoAccountTopPageIndexServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        List<User> users = em.createNamedQuery("getAllUser", User.class)
                .getResultList();
        em.close();

        request.setAttribute("users", users);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/noAccountTopPage/index.jsp");
        rd.forward(request, response);
    }

}
