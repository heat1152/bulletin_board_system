package controllers.recruitments;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Recruitment;
import utils.DBUtil;

@WebServlet("/recruitment/destroy")
public class RecruitmentDestroy extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RecruitmentDestroy() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Recruitment r = em.find(Recruitment.class, Integer.parseInt(request.getParameter("recruitment_id")));

            em.getTransaction().begin();
            em.remove(r);       // データ削除
            em.getTransaction().commit();
            em.close();

            request.getSession().setAttribute("flush", "募集削除完了");
            response.sendRedirect(request.getContextPath() + "/recruitment/index");

        }
    }

}
