package com.himedia.project_1.controller;


import com.himedia.project_1.dto.AdminVo;
import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.service.AdminService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @Autowired
    AdminService as;

    @GetMapping("/admin")
    public String admin() {
        return "admin/admin_loginForm";
    }

    @PostMapping("/adminLogin")
    public String login(@ModelAttribute("dto") @Valid AdminVo adminvo, BindingResult result,
                        HttpServletRequest request, Model model) {
        String url = "admin/admin_loginForm";
        if (result.getFieldError("id") != null) {
            model.addAttribute("message", "아이디를 입력하세요");
            System.out.println("오류");
        } else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else {
            AdminVo avo = as.getAdmin(adminvo.getAid());
            if (avo == null)
                model.addAttribute("message", "아이디 비번을 확인하세요");
            else if (!avo.getPwd().equals(adminvo.getPwd()))
                model.addAttribute("message", "아이디 비번을 확인하세요");
            else if (avo.getPwd().equals(adminvo.getPwd())) {
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", avo);
                url = "redirect:admin/adminMain";

                System.out.println(adminvo.getAid());
                System.out.println(adminvo.getPwd());

            }
        }
        return url;
    }






}
