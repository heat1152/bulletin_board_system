package controllers.NewAccount;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/account/new")
public class AccountNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public AccountNewServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/newAccount/new.jsp");
        rd.forward(request, response);

    }

}
