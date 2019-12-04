package com.youjin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApplicationScope1")
public class ApplicationScope1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApplicationScope1() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// application 객체 얻어오기
		ServletContext application = getServletContext();
		
		// application 객체에 값 추가하기
		int value = 1;
		application.setAttribute("value", value);
		
		// value 출력하기
		out.println("value : " + value);
	}

}
