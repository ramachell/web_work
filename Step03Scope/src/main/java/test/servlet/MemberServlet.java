package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/member")
public class MemberServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원 한명 정보 얻어오는 비즈니스 로직수행
		MemberDto dto = new MemberDto(1, "김구라", "노량진");

		// request scope 에 "dto"라는 키값으로 MemberDto type 담기
		req.setAttribute("dto", dto);

		RequestDispatcher rd = req.getRequestDispatcher("/member.jsp");

		rd.forward(req, resp);
	}

}
