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

import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>member list 표</title>");
		pw.println("</head>");
		pw.println("<body>");

		MemberDto dto = new MemberDto();

		List<MemberDto> list = new ArrayList<>();

		list.add(new MemberDto(1, "김1번", "구로"));
		list.add(new MemberDto(2, "김2번", "강남"));
		list.add(new MemberDto(3, "김3번", "역삼"));

		pw.println("<table border=\"1\">");
		pw.println("<tr> " + "<th>번호</th>" + "<th>이름</th>" + "<th>주소</th>" + "</tr>");
		for (MemberDto tmp : list) {
			pw.println("<tr> <td>" + tmp.getNum() + "</td> <td>" + tmp.getName() + "</td> <td>" + tmp.getAddr()
					+ "</td> </tr>");

		}
		pw.println("</body>");
		pw.println("</html>");
		pw.println("");

		pw.close();
	}
}
