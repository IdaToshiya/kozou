

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;

public class UseraddAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		try {
			String stockString = request.getParameter("stock");
			int stock = Integer.parseInt(stockString);
			String productnumber=request.getParameter("productnumber");
			String emailaddress=request.getParameter("emailaddress");
	//		String sex=request.getParameter("sex");
			
			System.out.println(emailaddress);
			
			KozouDAO dao=new KozouDAO();			
			Bean bean = dao.userproductinsert(stock, productnumber, emailaddress);
			
			if (bean == null) {
	            // 商品がすでに存在している場合
	            request.setAttribute("errorMessage", "この商品はすでに登録されています。削除済みアイテムから戻してください。");
	            request.setAttribute("emailaddress", emailaddress);
	            request.getRequestDispatcher("Useritemreturn.jsp").forward(request, response);
	            return null;
	        }
	
			if (bean != null && "female".equals(bean.getSex())) {
	
				request.setAttribute("bean", bean);
				request.getRequestDispatcher("userhome2.jsp").forward(request, response);
				
			} 
			else if (bean != null && "male".equals(bean.getSex())) {
				
				request.setAttribute("bean", bean);
				request.getRequestDispatcher("userhome.jsp").forward(request, response);
				
			}
	
			request.setAttribute("bean", bean);
			request.getRequestDispatcher("userhome3.jsp").forward(request, response);
			
			return  null;
			
		} catch (NumberFormatException e) {
	        // 数値変換エラー処理
	        request.setAttribute("errorMessage", "無効な個数が入力されました。");
	        request.getRequestDispatcher("Useritemadd.jsp").forward(request, response);
	        return null;
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "商品を追加する際にエラーが発生しました。");
	        request.getRequestDispatcher("Useritemadd.jsp").forward(request, response);
	        return null;
	    }
	}
}