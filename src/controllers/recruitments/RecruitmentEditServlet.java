package controllers.recruitments;

import java.io.IOException;

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

@WebServlet("/recruitment/edit")
public class RecruitmentEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RecruitmentEditServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Recruitment r = em.find(Recruitment.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        User login_user = (User)request.getSession().getAttribute("login_user");
        if(r != null && r.getUser().getId() == login_user.getId()){
            request.setAttribute("recruitment", r);
            request.setAttribute("_token", request.getSession().getId());
            request.getSession().setAttribute("recruitment_id", r.getId());
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recruitment/edit.jsp");
        rd.forward(request, response);
    }

}
