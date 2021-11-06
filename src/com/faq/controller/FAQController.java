package com.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faq.dao.FAQDao;
import com.faq.dto.FAQDto;
import com.notice.dao.NoticeDao;

@WebServlet("/faqanswer.do")
public class FAQController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		FAQDao dao = new FAQDao();
		
		if(command.equals("list")){
			List<FAQDto> list = dao.selectAll();
			System.out.println(list.size());
			for(int i=0; i<list.size(); i++) {
				System.out.println(list.get(i).getTitle());
			}
			
			request.setAttribute("list", list);
			RequestDispatcher disp = request.getRequestDispatcher("faqlist.jsp");
			disp.forward(request, response);
			
		}else if(command.equals("detail")) {
			int faqSeq = Integer.parseInt(request.getParameter("faqSeq"));
			
			FAQDto dto = dao.selectOne(faqSeq);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("faqdetail.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("writeform")) {
			
			//로그인을해주세요
//			FAQDao FAQDao = new FAQDao();
//			String regId = null;
//			if(request.getAttribute("regId") != null){
//				regId = (String) request.getAttribute("regId");
//			}
//			if(regId == null){
//				PrintWriter script = response.getWriter();
//				script.println("<script>");
//				script.println("alert('로그인을 해주세요');");
//				script.println("location.href = 'login.jsp'");
//				script.println("</script>");
//				script.close();
//				return;
//			}
			
			response.sendRedirect("faqwrite.jsp");
			
		}else if(command.equals("boardwrite")) {
			String regId = request.getParameter("regId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			FAQDto dto = new FAQDto();
			dto.setRegId(regId);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = dao.insert(dto);
			if(res>0) {
				dispatch("faqanswer.do?command=list", request, response);
			}else {
				dispatch("faqanswer.do?command=writeform", request, response);
			}
			
		}else if(command.equals("updateform")) {
			int faqSeq = Integer.parseInt(request.getParameter("faqSeq"));
			
			FAQDto dto = dao.selectOne(faqSeq);
			request.setAttribute("dto", dto);
			dispatch("faqupdate.jsp", request, response);
			
		}else if(command.equals("boardupdate")) {
			int faqSeq = Integer.parseInt(request.getParameter("faqSeq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			FAQDto dto = new FAQDto();
			dto.setFaqSeq(faqSeq);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = dao.update(dto);
			
			if(res>0) {
				dispatch("faqanswer.do?command=list", request, response);
			}else {
				dispatch("faqanswer.do?command=detail&noticeSeq="+faqSeq, request, response);
			}
			
		}else if(command.equals("delete")) {
			int faqSeq = Integer.parseInt(request.getParameter("faqSeq"));
			
			int res = dao.delete(faqSeq);
			
			//성공 시 목록으로		실패 시 상세페이지로
			if(res>0) {
				dispatch("faqanswer.do?command=list", request, response);
			}else {
				dispatch("faqanswer.do?command=detail&noticeSeq="+faqSeq, request, response);
			}
			
		}
		
		
		
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

