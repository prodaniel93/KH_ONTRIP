package com.ontrip.member.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.heart.service.HeartService;
import com.ontrip.heart.vo.Heart;
import com.ontrip.image.vo.Image;

@WebServlet("/mypageHeartList.me")
public class HeartList extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public HeartList() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(memberNo);
		
		ArrayList<Heart> htList = new HeartService().selectHeart(memberNo);
		
		request.setAttribute("htList", htList);
		
		
		request.getRequestDispatcher("views/myPage/myPageHeartList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
