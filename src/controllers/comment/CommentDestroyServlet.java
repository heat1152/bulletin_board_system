package controllers.comment;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comment;
import utils.DBUtil;

@WebServlet("/comment/destroy")
public class CommentDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CommentDestroyServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Comment c = em.find(Comment.class, Integer.parseInt(request.getParameter("comment_id")));


            em.getTransaction().begin();
            em.remove(c);       // データ削除
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "コメントを削除完了");
            response.sendRedirect(request.getContextPath() + "/recruitment/show?id="+c.getRecruitment().getId());
        }
    }

}
