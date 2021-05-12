package com.as.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class InquiryController {


	/*문의사항 글쓰기 컨트롤러*/
    @GetMapping("front/inquiry")
    public String inquiry_front(Model model) {

        return "front/inquiry";
    }

    @PostMapping("front/inquiry")
    public String inquiry_front(Model model, String title) {

        return "front/inquiry";
    }

    /*문의사항 모아보기 컨트롤러(admin)*/
    @GetMapping("admin/inquiry_list")
    public String inquiry_list_admin(Model model) {

        return "admin/inquiry_list";
    }

    @PostMapping("admin/inquiry_list")
    public String inquiry_list_admin(Model model, String title) {

        return "admin/inquiry_list";
    }

    /*문의사항 모아보기 컨트롤러(front)*/
    @GetMapping("front/inquiry_list_front")
    public String inquiry_list_front(Model model) {

        return "front/inquiry_list_front";
    }

    @PostMapping("front/inquiry_list_front")
    public String inquiry_list_front(Model model, String title) {

        return "front/inquiry_list_front";
    }

    /*문의사항 디테일 컨트롤러(admin)*/
    @GetMapping("admin/inquiry_details_admin")
    public String inquiry_details_admin(Model model) {

        return "admin/inquiry_details_admin";
    }

    @PostMapping("admin/inquiry_details_admin")
    public String inquiry_details_admin(Model model, String title) {

        return "admin/inquiry_details_admin";
    }

    /*문의사항 디테일 컨트롤러(front)*/
    @GetMapping("front/inquiry_details_front")
    public String inquiry_details_front(Model model) {

        return "front/inquiry_details_front";
    }

    @PostMapping("front/inquiry_details_front")
    public String inquiry_details_front(Model model, String title) {

        return "front/inquiry_details_front";
    }



}