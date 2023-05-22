package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 3. 어떤 경로 요청 처리할건지 설정 /로 시작해야됨!
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	// 1. HttpServlet 상속받기

	// 2.service() 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		// 클라이언트에게 문자열을 응답할수 있는 객체의 참조값 얻기
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>오늘의 운세 페이지 </title>");
		pw.println("</head>");
		pw.println("<body>");
		// 오늘의 운세 5개를 미리 준비해둔다.

		String[] fortunes = { "동쪽으로 가면 귀인", "오늘은 집에만 있기", "너무 멀리가지 않기", "다되는날", "로또됨" };
		Random ran = new Random();

		pw.println("<p>" + fortunes[ran.nextInt(5)] + "</p>");

		pw.println("</body>");
		pw.println("</html>");

		pw.close();
	}

}
