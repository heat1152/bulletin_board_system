package controllers.recruitments;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Recruitment;
import utils.DBUtil;

@WebServlet("/recruitment/update")
public class RecruitmentUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RecruitmentUpdateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Recruitment r = em.find(Recruitment.class,(Integer)(request.getSession().getAttribute("recruitment_id")));

            r.setContents(request.getParameter("recruitment_contents"));
            r.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            em.getTransaction().begin();
            em.getTransaction().commit();
            em.close();

            request.getSession().removeAttribute("recruitment_id");

            response.sendRedirect(request.getContextPath() + "/recruitment/show?id="+r.getId());
        }
    }
}
