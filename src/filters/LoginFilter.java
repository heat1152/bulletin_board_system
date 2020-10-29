package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebFilter("/*")
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String context_path = ((HttpServletRequest)request).getContextPath();
        String servlet_path = ((HttpServletRequest)request).getServletPath();

        if(!servlet_path.matches("/css.*")&&!servlet_path.matches("/user_initial_icon.*")
                &&!servlet_path.matches("/user_photo.*")) {// CSSフォルダ、ユーザーアイコン画像フォルダ内は認証処理から除外する
            HttpSession session = ((HttpServletRequest)request).getSession();

            // セッションスコープに保存されたログインユーザ情報を取得
            User u = (User)session.getAttribute("login_user");

            if(!servlet_path.equals("/login")&&!servlet_path.equals("/account/new")
                    &&!servlet_path.equals("/account/create")&&!servlet_path.equals("/index.html")
                    &&!servlet_path.equals("/recruitment/index")&&!servlet_path.equals("/recruitment/show")
                    &&!servlet_path.equals("/user/show")) {//ログイン、新規登録、トップページ、ユーザー詳細、募集詳細、募集一覧以外にアクセスした場合
                // ログアウトしている状態であれば
                // ログイン画面にリダイレクト
                if(u == null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/login");
                    return;
                }

            }
            if(servlet_path.equals("/login")||servlet_path.equals("/account/new")
                    ||servlet_path.equals("/account/create")){//ログイン、新規登録画面にアクセスした場合

                //ログイン状態であればトップページへリダイレクト
                if(u != null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;

                }
            }
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {

    }

}
