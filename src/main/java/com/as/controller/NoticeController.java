package com.as.controller;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.as.dto.Notice;
import com.as.dto.Sequence;
import com.as.mapper.NoticeMapper;


@Controller
public class NoticeController {

	@Autowired NoticeMapper noticeMapper;

	/*공지사항 글쓰기 컨트롤러*/
    @GetMapping("admin/notice/notice_write")
    public String notice_front(Model model) {

        return "admin/notice/notice_write";
    }

    @PostMapping("admin/notice/notice_write")
    public String notice_front(Model model, Principal principal, String title, String body) {
    	 Notice notice = new Notice();

         notice.setSnum(principal.getName());
         notice.setTitle(title);
         notice.setBody(body);
         notice.setViews(0);

         noticeMapper.insertNotice(notice);

         return "redirect:notice_list";
    }

    /*공지사항 글쓰기 수정 컨트롤러*/
    @GetMapping("admin/notice/notice_edit")
    public String notice_edit(Model model, int no, HttpSession session) {

    	session.setAttribute("no", no);
    	model.addAttribute("notice_list", noticeMapper.findByNo(no));
        return "admin/notice/notice_edit";
    }

    @PostMapping("admin/notice/notice_edit")
    public String notice_edit(Model model, Principal principal, String title, String body, HttpSession session) {

    	int no = (int) session.getAttribute("no");

    	Notice notice = noticeMapper.findByNo(no);

         notice.setSnum(principal.getName());
         notice.setTitle(title);
         notice.setBody(body);
         notice.setViews(0);

         noticeMapper.updateNotice(notice);

         session.removeAttribute("no");

         return "redirect:notice_list";
    }

    // 공지사항 글 삭제
    @RequestMapping
    (value = "admin/notice/notice_delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("no") int no) throws Exception {

    Notice notice = noticeMapper.findByNo(no);

    noticeMapper.deleteNotice(notice);


     return "redirect:notice_list";
    }




    /*공지사항 리스트 컨트롤러*/
    @GetMapping("admin/notice/notice_list")
    public String notice_list(Model model, String title, String a) {

    	List<Notice> list = noticeMapper.findAll();
    	Collections.sort(list);

    	model.addAttribute("notice_list", list);

        return "admin/notice/notice_list";
    }

    @PostMapping("admin/notice/notice_list")
    public String notice_list(Model model, String title) {

    	if (title == null) title = "";

    	List<Notice> list = noticeMapper.findByTitle("%" +title + "%");
    	Collections.sort(list);

    	model.addAttribute("notice_list", list);
    	model.addAttribute("title", title);

        return "admin/notice/notice_list";
    }

    /*공지사항 리스트 회원 컨트롤러*/
    @GetMapping("user/notice/notice_list_front")
    public String notice_list_front(Model model, HttpSession session) {

    	List<Notice> list = noticeMapper.findAll();
    	Collections.sort(list);
    	model.addAttribute("notice_list", list);

    	session.setAttribute("list_length", list.size());



        return "user/notice/notice_list_front";
    }

    @PostMapping("user/notice/notice_list_front")
    public String notice_list_front2(Model model, String title) {

    	if (title == null) title = "";

    	List<Notice> list = noticeMapper.findByTitle("%" +title + "%");
    	Collections.sort(list);

    	model.addAttribute("notice_list", list);
    	model.addAttribute("title", title);


        return "user/notice/notice_list_front";
    }

    /*공지사항 디테일 회원 컨트롤러*/
    @GetMapping("user/notice/notice_details")
    public String notice_details(Model model, int no, String nextTitle, String preTitle, HttpSession session) {

    	int LX = noticeMapper.findLX();

    	Notice notice = noticeMapper.findByNo(no);
    	Sequence list = noticeMapper.find_ud_notice(no);



    	notice.setViews(notice.getViews()+1);

    	if(no == 1) {
        	Notice next = noticeMapper.findByNo(list.getNextNo());

        	nextTitle = next.getTitle();
    		preTitle = "게시글이 존재하지 않습니다";

    		model.addAttribute("nextTitle",nextTitle);
        	model.addAttribute("preTitle",preTitle);

        	int next_no = list.getNextNo();
        	int pre_no = list.getPreNo();

        	model.addAttribute("notice_next",next_no);
        	model.addAttribute("notice_pre", pre_no);
    	}
    	else if(no == LX) {
    		Notice previous = noticeMapper.findByNo(list.getPreNo());

        	preTitle = previous.getTitle();
    		nextTitle = "게시글이 존재하지 않습니다";

    		model.addAttribute("nextTitle",nextTitle);
        	model.addAttribute("preTitle",preTitle);

        	int pre_no = list.getPreNo();
        	int next_no = list.getNextNo();

        	model.addAttribute("notice_next",next_no);
        	model.addAttribute("notice_pre", pre_no);
    	}
    	else {
        	Notice next = noticeMapper.findByNo(list.getNextNo());
        	Notice previous = noticeMapper.findByNo(list.getPreNo());

        	nextTitle = next.getTitle();
        	preTitle = previous.getTitle();

        	model.addAttribute("nextTitle",nextTitle);
        	model.addAttribute("preTitle",preTitle);

        	int next_no = list.getNextNo();
        	int pre_no = list.getPreNo();

        	model.addAttribute("notice_next",next_no);
        	model.addAttribute("notice_pre", pre_no);

    	}

    	model.addAttribute("LX", LX);
    	model.addAttribute("notice_list", notice);

    	noticeMapper.updateNotice_views(notice);

        return "user/notice/notice_details";
    }

    @PostMapping("user/notice/notice_details")
    public String notice_details2(Model model) {

        return "user/notice/notice_details";
    }


}
