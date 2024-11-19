import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;

public class LoginAction extends Action {

	public String execute(
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String hashedPassword = HashUtil.hashPassword(password);

		KozouDAO dao = new KozouDAO();
		Bean bean = dao.search(nickname, hashedPassword);

		// デバッグ用ログ（本番では削除するか、重要情報を出力しない）
		System.out.println("Login Attempt: Nickname=" + nickname + ", Bean=" + bean);

		// 管理者チェック
		if (bean != null && "管理人".equals(bean.getNickname()) &&
				"d5ebd832efabc2bb4b1be4b48c1478223f1168e5c21b6804b293e326bc00842b".equals(bean.getPassword())) {
      
			RequestDispatcher dispatcher = request.getRequestDispatcher("SearchServlet");
			dispatcher.forward(request, response);

		} 
//		女性ユーザだった場合
		else if (bean != null && "female".equals(bean.getSex())) {

			request.setAttribute("bean", bean);
			request.getRequestDispatcher("userhome2.jsp").forward(request, response);
			
		} 
//		男性ユーザーだった場合
		else if (bean != null && "male".equals(bean.getSex())) {
			
			request.setAttribute("bean", bean);
			request.getRequestDispatcher("userhome.jsp").forward(request, response);
			
		}

		// ログイン失敗時の処理
		request.setAttribute("error", "ニックネームまたはパスワードが正しくありません。");
		return "Login.jsp";
    
	}
}
