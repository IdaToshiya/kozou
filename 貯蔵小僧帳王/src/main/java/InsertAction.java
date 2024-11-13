import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.KozouDAO;
import tool.Action;

public class InsertAction extends Action {

	public String execute (
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
		String password = request.getParameter("password");
		String hashedPassword = HashUtil.hashPassword(password);
		
		String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        LocalDate date = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
        String dateOfBirth = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		String nickname=request.getParameter("nickname");
		String emailAddress=request.getParameter("emailAddress");
		String sex=request.getParameter("sex");
		String prefectures=request.getParameter("prefectures");
		
		KozouDAO dao=new KozouDAO();
		int line=dao.instert(nickname, hashedPassword, emailAddress, dateOfBirth, sex, prefectures);

		if (line>0) {
			return "Login.jsp";
		}
		
		return "new.jsp";
	}
}
