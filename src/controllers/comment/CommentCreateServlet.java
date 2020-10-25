package controllers.comment;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comment;
import models.Recruitment;
import models.User;
import utils.DBUtil;

@WebServlet("/comment/create")
public class CommentCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CommentCreateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Comment c = new Comment();

            Recruitment r = em.find(Recruitment.class, Integer.parseInt(request.getParameter("recruitment_id")));

            c.setUser((User)request.getSession().getAttribute("login_user"));
            c.setRecruitment(r);
            c.setContents(request.getParameter("comments"));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            c.setCreated_at(currentTime);
            c.setUpdated_at(currentTime);

            em.getTransaction().begin();
            em.persist(c);
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "コメントを投稿しました");

            response.sendRedirect(request.getContextPath() + "/recruitment/show?id="+r.getId());
        }
    }

}
