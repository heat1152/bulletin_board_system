package controllers.login;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;
import utils.EncryptUtil;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public LoginServlet() {
        super();
    }
    //ログイン画面表示
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("hasError", false);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
        rd.forward(request, response);
    }

    //ログイン処理の実行
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //認証結果を格納する変数
        Boolean check_result = false;
        String name = request.getParameter("name");
        String plain_pass = request.getParameter("password");

        User u = null;

        if(name != null && !name.equals("") && plain_pass != null && !plain_pass.equals("")) {
            EntityManager em = DBUtil.createEntityManager();

            String password = EncryptUtil.getPasswordEncrypt(
                    plain_pass,
                    (String)this.getServletContext().getAttribute("pepper")
                    );

            // 名前とパスワードが正しいかチェックする
            try {
                u = em.createNamedQuery("checkLoginNameAndPassword", User.class)
                      .setParameter("name", name)
                      .setParameter("pass", password)
                      .getSingleResult();
            } catch(NoResultException ex) {}

            em.close();

            if(u != null) {
                check_result = true;
            }
        }
        if(!check_result) {
            // 認証できなかったらログイン画面に戻る
            request.setAttribute("hasError", true);
            request.setAttribute("name", name);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
            rd.forward(request, response);
        } else {
            // 認証できたらログイン状態にしてトップページへリダイレクト
            request.getSession().setAttribute("login_user", u);
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
