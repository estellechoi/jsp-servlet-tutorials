package com.youjin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter writer = response.getWriter();

		writer.println("<html>");
		writer.println("<head><title>hello world</title></head>");
		writer.println("<body>");

		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String contextPath = request.getContextPath();
		String remoteAddr = request.getRemoteAddr(); // 클라이언트의 주소값 

		writer.println(uri + "<br />");
		writer.println(url + "<br />");
		writer.println(contextPath + "<br />");
		writer.println(remoteAddr + "<br />");

		writer.println("</body>");
		writer.println("</html>");
		writer.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
