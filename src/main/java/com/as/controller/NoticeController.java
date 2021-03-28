package com.as.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class NoticeController {



    @GetMapping("admin/notice_front")
    public String text1(Model model) {
        return "admin/notice_front";
    }

    @PostMapping("admin/notice_front")
    public String text1(Model model, String title) {


        return "admin/notice_front";
    }

}
