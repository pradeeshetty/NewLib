package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnection.DbConnection;

/**
 * Servlet implementation class DeleteRequest
 */
@WebServlet("/DeleteRequest")
public class DeleteRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		 String bookid = request.getParameter("bookid");
		 String userid = request.getParameter("userid");
		 DbConnection d=new DbConnection();
		 int i=d.deleterequest(bookid, userid);
		 if(i!=0)
		 {
			  out.println("<script type=\"text/javascript\">");
			  out.println("alert('Request Deleted successfully');");
			  out.println("location='requestedbook.jsp';");
			  out.println("</script>");
		 }
		 else
		 {
			  out.println("<script type=\"text/javascript\">");
			  out.println("alert('Error');");
			  out.println("location='requestedbook.jsp';");
			  out.println("</script>");
		 }
		
	}

}
