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
		
		if(command.equals("/BoardWriteForm.do")) {
			reqeustSignInName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeBoard.jsp");
			rd.forward(request, response);
			
		} else if(command.equals("/BoardWriteActoin.do")) {
			// TODO- 글쓰는 로직을 수행하는 함수 생성
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
			
		} else if(command.equals("/BoardViewAction.do")) {
			// TODO- 글을 보는 로직을 수행하는 함수 생성
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
			
		} else if(command.equals("/BoardView.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
			
		} else if(command.equals("/BoardUpdateActoin.do")) {
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		} else if(command.equals("/BoardDelAction.do")) {
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do?");
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
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		// 매개변수 2개짜리: 게시판의 총 개수 리턴
		int total_record = dao.getListCount(items, text);
		// 매개변수 4개짜리
		boardList = dao.getBoardList(pageNum, limit, items, text);
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardList", boardList);
		
		// 페이징 개수 구하기
		int total_page; // 30 => 6개
		
		if(total_record % limit == 0) {
			total_page = total_record / limit;
		} else {
			total_page = (total_record / limit)+1; 
		}
		
		request.setAttribute("total_page", total_page);
		request.setAttribute("boardlist", boardList);
	}
	
	public void requestProjectList(HttpServletRequest request) { // 등록된 글 목록 가져오기
		ProjectRepository dao = ProjectRepository.getInstance();
		List<Project> projectList = dao.getAllProject(request.getParameter("constraint"));  // 다형성
		
		request.setAttribute("projects", projectList);
		request.setAttribute("edit", request.getParameter("edit"));
		System.out.println("아우");
	}
	
	// 인증된 사용자명을 가져오는 함수 구현
	public void reqeustSignInName(HttpServletRequest request) {
		String id = request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getSignInNameById(id);
		request.setAttribute("name", name);
	}
	
	// 게시글 쓰기
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();	
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
	}
	
	// 게시글 상세 페이지 가져오기
	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
	}
	
	// 글 수정하기
	public void requestBoardUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
	
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setUpdate_date(request.getParameter("update_date"));
		board.setIp(request.getRemoteAddr());
		
		dao.updateBoard(board);
	}
	
	// 글 삭제하기
	public void requestBoardDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO board = BoardDAO.getInstance();
		board.delBoard(num);
	}
	
}
