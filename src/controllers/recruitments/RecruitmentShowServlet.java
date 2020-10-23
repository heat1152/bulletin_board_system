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
import utils.DBUtil;


@WebServlet("/recruitment/show")
public class RecruitmentShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RecruitmentShowServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Recruitment r = em.find(Recruitment.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("recruitment", r);
        request.setAttribute("_token", request.getSession().getId());
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recruitment/show.jsp");
        rd.forward(request, response);
    }

}
