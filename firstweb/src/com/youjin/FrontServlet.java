package com.youjin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Front")
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int randomVal = (int) (Math.random() * 6) + 1; // 1 ~ 6
		
		// 클라이언트 요청정보를 담은 request 객체에 "randomVal" 라는 이름으로 값을 추가한다.
		// 값부분 인자 타입은 Object (모든 타입의 값을 저장할 수 있도록)
		// 추후 값을 얻어낼 때도 Object 타입으로 받는다.
		request.setAttribute("randomVal", randomVal);
		
		// RequestDispatcher 객체를 생성한다.
		// 이동할 경로를 인자값으로 주고, / 로 시작한다.
		// 요청 포워딩은 같은 웹어플리케이션 안에서만 가능하다.
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Next");
		
		// forward(request, response) 메소드를 사용해 포워드 한다.
		requestDispatcher.forward(request, response);
	}

}
