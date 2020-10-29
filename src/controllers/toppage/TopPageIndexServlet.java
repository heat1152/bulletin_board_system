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

import models.Recruitment;
import models.User;
import utils.DBUtil;

@WebServlet("/index.html")
public class TopPageIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TopPageIndexServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }

        List<Recruitment> recruitments = em.createNamedQuery("getMyRecruitments", Recruitment.class)
                .setParameter("login_user", login_user)
                .setFirstResult(10 * (page - 1))
                .setMaxResults(10)
                .getResultList();

        long recruitments_count = (long)em.createNamedQuery("getMyRecruitmentsCount", Long.class)
                .setParameter("login_user", login_user)
                .getSingleResult();

        List<Recruitment> new_recruitments = em.createNamedQuery("getAllRecruitments", Recruitment.class)
                .setMaxResults(3)
                .getResultList();

        em.close();

        request.setAttribute("new_recruitments", new_recruitments);
        request.setAttribute("recruitments", recruitments);
        request.setAttribute("recruitments_count", recruitments_count);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/index.jsp");
        rd.forward(request, response);

    }

}
