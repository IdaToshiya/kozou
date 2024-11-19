import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;


public class LoginAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		HttpSession session=request.getSession();
			
			String password = request.getParameter("password");
			String nickname=request.getParameter("nickname");
			String hashedPassword = HashUtil.hashPassword(password);

			KozouDAO dao=new KozouDAO();
			Bean bean=dao.search(nickname, hashedPassword);
			
			// こんな風にすれば Bean の中身がログに出力できる
//			String aaa =( ToStringBuilder.reflectionToString(bean, ToStringStyle.DEFAULT_STYLE) );
			
			// デバッグ用ログ（本番では削除するか、重要情報を出力しない）
	        System.out.println("Login Attempt: Nickname=" + nickname + ", Bean=" + bean);

	        // 管理者チェック
	        if (bean != null && "管理人".equals(bean.getNickname()) && 
	            "d5ebd832efabc2bb4b1be4b48c1478223f1168e5c21b6804b293e326bc00842b".equals(bean.getPassword())) {
	            // セッションに情報を保存（必要なら）
	            session.setAttribute("user", bean);
	            
//	            response.sendRedirect("SearchServlet");
	            
	            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchServlet");
				dispatcher.forward(request, response);
	            return null; // フォワード後の処理を停止
	        }

	        // 一般ユーザーの場合
	        if (bean != null) {
	            // セッションに情報を保存
	            session.setAttribute("user", bean);

	            // ユーザーホーム画面にフォワード
	            request.setAttribute("bean", bean);
	            request.getRequestDispatcher("userhome.jsp").forward(request, response);
	            return null; // フォワード後はreturn不要
	        }

	        // ログイン失敗時の処理
	        request.setAttribute("error", "ニックネームまたはパスワードが正しくありません。");
	        return "Login.jsp";
	    }
	}
