package controllers.NewAccount;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;
import utils.EncryptUtil;


@WebServlet("/account/create")
public class AccountCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public AccountCreateServlet() {
        super();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
        EntityManager em = DBUtil.createEntityManager();

        User u = new User();


        String name = request.getParameter("name");
        String password = EncryptUtil.getPasswordEncrypt(
                request.getParameter("password"),
                (String)this.getServletContext().getAttribute("pepper"));

        u.setName(name);
        u.setPassword(password);

        em.getTransaction().begin();
        em.persist(u);
        em.getTransaction().commit();

        try {
            u = em.createNamedQuery("checkLoginNameAndPassword", User.class)
                  .setParameter("name", name)
                  .setParameter("pass", password)
                  .getSingleResult();
        } catch(NoResultException ex) {}

        em.close();

        request.getSession().setAttribute("login_user", u);
        request.getSession().setAttribute("flush", "新規登録完了");
        response.sendRedirect(request.getContextPath() + "/");
        }
    }

}
