package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DbConnection.DbConnection;
import com.model.AddRequest;

/**
 * Servlet implementation class RejectBook
 */
@WebServlet("/RejectBook")
public class RejectBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RejectBook() {
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
		//doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		AddRequest ar=new AddRequest();
		String bookid=request.getParameter("bookid");
		String userid=request.getParameter("userid");
		String reqid=request.getParameter("requestid");
		String msg="Sorry ! Your request has been rejected !";
		DbConnection d=new DbConnection();
		int i=d.rejectrequest(bookid,reqid);
	
		ar.setBookid(bookid);
		ar.setUserid(userid);
		System.out.println("i "+i);
		if(i!=0)
		{
			  d.addmsg(ar, msg);
			  out.println("<script type=\"text/javascript\">");
			  out.println("alert('Rejected successfully');");
			  out.println("location='bookrequest.jsp';");
			  out.println("</script>");
		}
		else
		{
			  out.println("<script type=\"text/javascript\">");
			  out.println("alert('Failed to reject');");
			  out.println("location='bookrequest.jsp';");
			  out.println("</script>");
		}
	}

}
