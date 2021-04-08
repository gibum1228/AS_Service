package com.as.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class NoticeController {


	/*공지사항 글쓰기 컨트롤러*/
    @GetMapping("admin/notice_write")
    public String notice_front(Model model) {

        return "admin/notice_write";
    }

    @PostMapping("admin/notice_write")
    public String notice_front(Model model, String title) {

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

}
