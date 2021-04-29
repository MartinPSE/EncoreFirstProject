package controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.CustomerDaoImpl;

public class LoginController implements Controller{

		@Override
		public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			PrintWriter out= response.getWriter();
			String id = request.getParameter("custId");
			String password = request.getParameter("custPw");
			String path = "";
			
			try {
				Customer rvo = CustomerDaoImpl.getInstance().signIn(id, password);
				HttpSession session =request.getSession();
				if(rvo != null) {
					session.setAttribute("rvo", rvo); // Customer ��ü�� ��������.
					path = URLEncoder.encode("Index.jsp","UTF-8");
					
				}else {
					path = URLEncoder.encode("register.jsp","UTF-8");
	            }
	        } catch (SQLException e) {
	        	path = URLEncoder.encode("login.jsp","UTF-8");
	        }
			return new ModelAndView(path, true);
		}
}
