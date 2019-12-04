package com.youjin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Next")
public class NextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NextServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// FirstServlet 에게서 요청을 포워드 받으면서 request, response 객체도 전달 받았다.

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>hello</title></head>");
		writer.println("<body>");

		// 전달 받은 request 객체에 저장된 "randomVal"라는 이름의 값을 얻어낸다.
		// 얻어낸 값의 타입은 Object 이므로 적절한 형변환이 필요하다.
		int randomVal = (Integer) request.getAttribute("randomVal");
		writer.println("randomVal : " + randomVal + "<br />");

		for (int i = 0; i < randomVal; i++) {
			writer.println("hi<br />");
		}

		writer.println("</body>");
		writer.println("</html>");
	}

}
