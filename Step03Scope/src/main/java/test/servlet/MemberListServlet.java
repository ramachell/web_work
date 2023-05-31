package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로직 수행해서 얻어낸 데이터(Model)

		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김1번", "구로"));
		list.add(new MemberDto(2, "김2번", "강남"));
		list.add(new MemberDto(3, "김3번", "강북"));

		// jsp 페이지에 전달할 Model을 request scope에 담기
		// "list"라는 key 값으로 List<MemberDto> type 담기
		req.setAttribute("list", list);

		// jsp 페이지로 forward 이동
		RequestDispatcher rd = req.getRequestDispatcher("/member/list.jsp");
		rd.forward(req, resp);
	}

}
