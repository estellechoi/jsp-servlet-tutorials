package com.youjin.api.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.youjin.api.dao.RoleDao;
import com.youjin.api.dto.Role;

// roles/ 뒤에 어떤 문자가 와도 해당 서블릿을 찾는다.
@WebServlet("/roles/*")
public class RoleByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoleByIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		String pathInfo = request.getPathInfo(); // roles/{roleId}
		String[] pathParts = pathInfo.split("/");
		int id = Integer.parseInt(pathParts[1]); // roles/ 뒷 부분의 숫자를 가져온다.
		
		RoleDao dao = new RoleDao();
		
		Role role = dao.getRole(id);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(role);
		
		PrintWriter out = response.getWriter();
		out.println(json);
		out.close();
		
	}

}
