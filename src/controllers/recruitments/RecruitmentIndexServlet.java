package controllers.recruitments;

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
import utils.DBUtil;


@WebServlet("/recruitment/index")
public class RecruitmentIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RecruitmentIndexServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Recruitment> recruitments = em.createNamedQuery("getAllRecruitments", Recruitment.class)
                                  .setFirstResult(10 * (page - 1))
                                  .setMaxResults(10)
                                  .getResultList();

        long recruitments_count = (long)em.createNamedQuery("getRecruitmentsCount", Long.class)
                                     .getSingleResult();

        em.close();

        request.setAttribute("recruitments", recruitments);
        request.setAttribute("recruitments_count", recruitments_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recruitment/index.jsp");
        rd.forward(request, response);
    }

}
