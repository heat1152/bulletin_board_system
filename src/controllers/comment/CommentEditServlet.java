package controllers.comment;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comment;
import models.User;
import utils.DBUtil;


@WebServlet("/comment/edit")
public class CommentEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CommentEditServlet() {
        super();
     }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Comment c = em.find(Comment.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        User login_user = (User)request.getSession().getAttribute("login_user");
        if(c != null && c.getUser().getId() == login_user.getId()){
            request.setAttribute("comment", c);
            request.setAttribute("_token", request.getSession().getId());
            request.getSession().setAttribute("comment_id", c.getId());
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/comment/edit.jsp");
        rd.forward(request, response);
    }

}
