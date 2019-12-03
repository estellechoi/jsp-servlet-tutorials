package com.youjin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LifecycleServlet")
public class LifecycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 생성자
	public LifecycleServlet() {
		super();
		System.out.println("LifeCycleServlet 생성자 호출 !");
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 메소드 호출");
	}

	public void destroy() {
		System.out.println("destroy() 메소드 호출");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head><title>fill the form</title></head>");
		writer.println("<body>");
		writer.println("<form action='/firstweb/LifecycleServlet' method='post'>");
		writer.println("<input type='text' name='name' placeholder='name'><br />");
		writer.println("<input type='submit' value='save'>");
		writer.println("</form>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
			PrintWriter writer = resp.getWriter();
		String name = req.getParameter("name");
		writer.println("name : " + name);
		writer.close();
	}

//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service() 메소드 호출");
//	}

}
