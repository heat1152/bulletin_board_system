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
import models.User;
import utils.DBUtil;


@WebServlet("/recruitment/create")
public class RecruitmentCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RecruitmentCreateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Recruitment r = new Recruitment();

            r.setUser((User)request.getSession().getAttribute("login_user"));
            r.setContents(request.getParameter("recruitment_contents"));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            r.setCreated_at(currentTime);
            r.setUpdated_at(currentTime);

            em.getTransaction().begin();
            em.persist(r);
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "投稿完了");
            response.sendRedirect(request.getContextPath() + "/recruitment/index");
        }
    }

}
