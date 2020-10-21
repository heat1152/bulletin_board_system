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

        if(!servlet_path.matches("/css.*")) {       // CSSフォルダ内は認証処理から除外する
            HttpSession session = ((HttpServletRequest)request).getSession();

            // セッションスコープに保存されたログインユーザ情報を取得
            User u = (User)session.getAttribute("login_user");

            if(!servlet_path.equals("/login")||!servlet_path.equals("/noAccountTopPage")) {//ログイン画面、ログイン前トップページ以外について
                // ログアウトしている状態であれば
                // ログイン前トップページ画面にリダイレクト
                if(u == null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/noAccountTopPage");
                    return;
                }
            } else {                                    // ログイン画面について
                // ログインしているのにログイン画面を表示させようとした場合は
                // ログイン前トップページにリダイレクト
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
