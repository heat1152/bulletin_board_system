package controllers.user;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.User;
import utils.DBUtil;


@WebServlet("/user/update")
@MultipartConfig(location="/tmp", maxFileSize=1080*1080)
public class UserUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public UserUpdateServlet() {
        super();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
        EntityManager em = DBUtil.createEntityManager();

        User u = em.find(User.class, (Integer)(request.getSession().getAttribute("user_id")));

        u.setName(request.getParameter("name"));
        u.setProfile(request.getParameter("profile"));
        try{
        Part part = request.getPart("profile_photo");
        String file_name = part.getSubmittedFileName();
        part.write(getServletContext().getRealPath("/user_photo")+"/"+file_name);

        u.setProfile_phto(file_name);
        }catch (IOException e) {
            e.printStackTrace();
        }
        em.getTransaction().begin();
        em.getTransaction().commit();
        em.close();


        request.getSession().removeAttribute("user_id");
        request.getSession().setAttribute("flush", "更新完了");
        response.sendRedirect(request.getContextPath() + "/user/show?id="+u.getId());
        }
    }
}
