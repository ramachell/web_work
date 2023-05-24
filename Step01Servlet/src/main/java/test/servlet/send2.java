package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class send2 extends HttpServlet {

	/*
	 * service() 메소드엔 2개 객체 참조값 전달됨
	 * HttpServletRequest req
	 * 요쳥과 관련된 작업처리시 사용 
	 * 
	 * HttpServletResponse resp
	 * 응답과 관련된 작업처리시 사용
	 * 
	 */

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = req.getParameter("msg");

		System.out.println("msg : " + msg);

		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>오늘의 운세 페이지 </title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>asdasdasd</p>");

		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

}
