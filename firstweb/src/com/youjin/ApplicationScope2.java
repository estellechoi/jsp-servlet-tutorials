package com.youjin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ApplicationScope2")
public class ApplicationScope2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ApplicationScope2() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// application 객체 얻어내기
		ServletContext application = getServletContext();
		
		// application.getAttribute() 값이 없는 경우 예외 발생 가능
		// try catch 로 예외 피하기
		try {
			// application 객체에서 "value" 라는 이름의 값 가져오기
			int value = (int)application.getAttribute("value");
			
			// value 값을 바꾸고 다시 application 객체에 추가하기
			value++;
			application.setAttribute("value", value);
			
			out.println("value : " + value);			
		} catch(NullPointerException e) {
			out.println("value : null");			
		}
	}

}
