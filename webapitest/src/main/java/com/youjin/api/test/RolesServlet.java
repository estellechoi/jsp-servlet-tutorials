package com.youjin.api.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.youjin.api.dao.RoleDao;
import com.youjin.api.dto.Role;

@WebServlet("/RolesServlet")
public class RolesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RolesServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");;
		response.setContentType("application/json");
		
		RoleDao dao = new RoleDao();
		
		List<Role> list= dao.getRoles();
		
		// json 라이브러리가 제공하는 객체 : 객체 <-> json 문자 바꿔주는 객체 
		ObjectMapper objectMapper = new ObjectMapper();
		// list 객체를 json 문자열로 바꾼다.
		String json = objectMapper.writeValueAsString(list);
		
		PrintWriter out = response.getWriter();
		out.println(json);
		out.close();
		
	}

}
