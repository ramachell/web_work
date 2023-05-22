package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		List<String> names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		PrintWriter pw = resp.getWriter();

		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>오늘의 운세 페이지 </title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1> 친구목록 입니다 </h1>");
		pw.println("<ul>");
		for (int i = 0; i < names.size(); i++) {
			pw.println("<li>" + names.get(i) + "</li>");
		}
		pw.println("<li>" + names.get(0) + "</li>");
		pw.println("<li>" + names.get(1) + "</li>");
		pw.println("<li>" + names.get(2) + "</li>");
		pw.println("</ul>");
		pw.println("");
		pw.println("");
		pw.println("");

		pw.println("</body>");
		pw.println("</html>");
		pw.close();

	}

}
