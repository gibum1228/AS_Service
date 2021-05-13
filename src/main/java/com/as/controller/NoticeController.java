package com.as.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.as.dto.Notice;
import com.as.mapper.NoticeMapper;


@Controller
public class NoticeController {

	@Autowired NoticeMapper noticeMapper;

	/*공지사항 글쓰기 컨트롤러*/
    @GetMapping("admin/notice_write")
    public String notice_front(Model model) {

        return "admin/notice_write";
    }

    @PostMapping("admin/notice_write")
    public String notice_front(Model model, Principal principal, String title, String body) {
    	 Notice notice = new Notice();

         notice.setSnum(principal.getName());
         notice.setTitle(title);
         notice.setBody(body);
         notice.setViews(0);

         noticeMapper.insertNotice(notice);

        return "admin/notice_write";
    }

    /*공지사항 리스트 컨트롤러*/
    @GetMapping("admin/notice_list")
    public String notice_list(Model model) {

        return "admin/notice_list";
    }

    @PostMapping("admin/notice_list")
    public String notice_list(Model model, String title) {

        return "admin/notice_list";
    }

    /*공지사항 리스트 회원 컨트롤러*/
    @GetMapping("front/notice_list_front")
    public String notice_list_front(Model model) {

        return "front/notice_list_front";
    }

    @PostMapping("front/notice_list_front")
    public String notice_list_front2(Model model) {

        return "front/notice_list_front";
    }

    /*공지사항 디테일 회원 컨트롤러*/
    @GetMapping("front/notice_details")
    public String notice_details(Model model) {

        return "front/notice_details";
    }

    @PostMapping("front/notice_details")
    public String notice_details2(Model model) {

        return "front/notice_details";
    }


}
