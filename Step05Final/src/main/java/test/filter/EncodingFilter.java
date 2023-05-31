package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") // "/*" 는 이 모든 프로젝트에 해당하는 모든 파일을 의미함
public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
	}

	// 필터가 동작할때 호출되는 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 1 만일 인코딩 설정이 되지 않았다면
		if (request.getCharacterEncoding() == null) {
			// post 방식 전송했을때 한글 깨짐 방지
			request.setCharacterEncoding("utf-8");
		}
		// 2 요청의 흐름 이어가기
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
