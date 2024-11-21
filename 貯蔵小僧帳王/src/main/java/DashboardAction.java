
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Bean;
import dao.KozouDAO;
import tool.Action;

public class DashboardAction extends Action {
	public String execute(
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		//今日の日付
			LocalDateTime date = LocalDateTime.now();
			String today = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
        
		//dbからデータを取得
			KozouDAO dao=new KozouDAO();
			List<Bean> beans = dao.dashboard1(today);// List<Bean> を取得
			List<Bean> productbeans = dao.dashboard2(today);
			List<Bean> top3Products = new ArrayList<>();
		    top3Products = productbeans.subList(0, Math.min(3, productbeans.size()));
			
	        // beansをリクエストにセット
	        request.setAttribute("beans", beans);
	        request.setAttribute("productbeans", productbeans);
	        request.setAttribute("top3Products", top3Products);
	        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);

	        return null;
	    }
	}
