package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectRepository;
import dto.Project;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class DataController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		System.out.println(RequestURI);
		System.out.println(contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/BoardListAction.do")) {
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}
		
		if(command.equals("/ProjectListAction.do")) {
			requestProjectList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./project/portfolioCollection.jsp");
			rd.forward(request, response);
		}
	}
	
	public void requestBoardList(HttpServletRequest request) { // 등록된 글 목록 가져오기
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();  // 다형성
		int pageNum = 1;
		int limit = LISTCOUNT; // 5
		
		// 페이지 번호가 있으면
		if(request.getParameter("pageNum") != null) pageNum = Integer.parseInt(request.getParameter("pageNum"));
		// 정수로 변환해서 pageNum에 저장함.
		boardList = dao.getBoardList(pageNum);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardList", boardList);
	}
	
	public void requestProjectList(HttpServletRequest request) { // 등록된 글 목록 가져오기
		ProjectRepository dao = ProjectRepository.getInstance();
		List<Project> projectList = dao.getAllProject(request.getParameter("constraint"));  // 다형성
		
		request.setAttribute("projects", projectList);
		System.out.println("아우");
	}
	
}
