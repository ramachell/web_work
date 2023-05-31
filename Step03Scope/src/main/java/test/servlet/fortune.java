package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class fortune extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 오늘의 운세를 얻어오는 비즈니스 로직을 수행(DB에서 읽어왔다고 가정하고)
		String fortune = "동쪽가면 귀인";

		/* HttpServletRequest 객체의 setAttribute(key, value) 메소드를 이용해서 응답에 필요한 데이터를 담아둘수있다
		 * 담은 데이터는 응답하기 전까지 유효하며 응답 마친 후엔 없어지는 1회성 데이터
		 * 담은 데이터를 얻어내는 방법은
		 * HttpServletRequest 객체의 getAttribute(key) 메소드 활용
		 * 담을때 Object type 으로 받기때문에 뭐든 받을수있지만
		 * 사용하려면 casting 필요
		 * 
		 * String aa = (String)req.getAttribute("bb");
		 */
		req.setAttribute("fortuneToday", fortune);

		// 응답 여기서 안하고 jsp 페이지로 응답 위임
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		/*
		 * webapp/test/fortune.jsp 페이지에게 응답을 대신하도록 하고
		 * 서블릿에 전달 받았던 HttpServletRequest, HttpServletRespons 객체의 참조값을 전달해준다
		 */

		rd.forward(req, resp);
	}
}
