package com.youjin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogicServlet")
public class LogicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogicServlet() {
		super();

	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int value1 = (int) (Math.random() * 10) + 1;
		int value2 = (int) (Math.random() * 10) + 1;
		int sum = value1 + value2;
		
		// 포워딩할 정보를 request 객체에 추가
		request.setAttribute("value1", value1);
		request.setAttribute("value2", value2);
		request.setAttribute("sum", sum);
		
		// 포워드 메소드를 가진 RequestDispatcher 객체 생성 및 포워딩 경로 지정
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/result.jsp");
		
		// 포워드 메소드 실행 (request, response 객체를 지정된 경로로 포워딩)
		requestDispatcher.forward(request, response);
	}

}
