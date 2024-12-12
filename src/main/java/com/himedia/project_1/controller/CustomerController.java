package com.himedia.project_1.controller;


import com.himedia.project_1.dto.*;
import com.himedia.project_1.service.CustomerService;
import com.himedia.project_1.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    CustomerService cs;

    @GetMapping("/customer")
    public ModelAndView customer(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("customer/customer");
        HashMap<String, Object> map = cs.getQnaList(request);
        HttpSession session = request.getSession();
        Object loginUser = session.getAttribute("loginUser");
        mav.addObject("loginUser", loginUser);
        mav.addObject("qnaList",map.get("qnaList"));
        mav.addObject("paging", map.get("paging"));
        mav.addObject("key", map.get("key"));
        return mav;
    }

    @GetMapping("QnaWrite")
    public String QnaWrite(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Object loginUser = session.getAttribute("loginUser");
        if(loginUser instanceof UserVo) {
            UserVo userVo = (UserVo) loginUser;
            model.addAttribute("loginUser1", userVo);
        }else if(loginUser instanceof BusinessmanVo){
            BusinessmanVo businessmanVo = (BusinessmanVo) loginUser;
            model.addAttribute("loginUser2", businessmanVo);
        }
        return "customer/QnaWrite";
    }

    @PostMapping("QnaWrite")
    public String QnaWrite(@ModelAttribute("dto")QnaVo qnavo, BindingResult result, Model model,HttpSession session) {
        Object loginUser = session.getAttribute("loginUser");
        int qseq=cs.insertQna(qnavo,loginUser);
        return "redirect:/QnaDetail?qseq="+qseq;
    }
    @GetMapping("QnaDetail")
    public ModelAndView QnaDetail(@RequestParam("qseq")int qseq,HttpSession session) {
        ModelAndView mav = new ModelAndView("customer/QnaDetail");
        Object loginUser = session.getAttribute("loginUser");
        if(loginUser instanceof UserVo) {
            mav.addObject("loginUser1", ((UserVo) loginUser).getId());
        }else if(loginUser instanceof BusinessmanVo){
            mav.addObject("loginUser2", ((BusinessmanVo) loginUser).getId());
        }
        QnaVo qnaVo= cs.getQnaDetail(qseq);
        mav.addObject("qnavo", qnaVo);
        return mav;
    }
    @GetMapping("updateQna")
    public ModelAndView updateQna(@RequestParam("qseq")int qseq,HttpSession session) {
        ModelAndView mav = new ModelAndView("customer/QnaUpdate");
        Object loginUser = session.getAttribute("loginUser");
        if(loginUser instanceof UserVo) {
            mav.addObject("loginUser1", ((UserVo) loginUser).getId());
        }else if(loginUser instanceof BusinessmanVo){
            mav.addObject("loginUser2", ((BusinessmanVo) loginUser).getId());
        }
        QnaVo qnaVo= cs.getQnaDetail(qseq);
        mav.addObject("qnavo", qnaVo);
        return mav;
    }
    @PostMapping("QnaUpdate")
    public String QnaUpdate(QnaVo qnavo,HttpSession session) {
        cs.updateQna(qnavo);
        return "redirect:/QnaDetail?qseq="+qnavo.getQseq();
    }
    @GetMapping("deleteQna")
    public String deleteQna(@RequestParam("qseq")int qseq,HttpSession session) {
        cs.deleteQna(qseq);
        return "redirect:/customer";
    }



//    @GetMapping("ZZim")
//    public ModelAndView ZZim(HttpServletRequest request) {
//        ModelAndView modelAndView = new ModelAndView();
//        UserVo loginUser = (UserVo) request.getSession().getAttribute("loginUser");
//        List<ZzimVo>list=us.getZZim(loginUser.getId());
//        modelAndView.addObject("ZZim", list);
//        modelAndView.setViewName("mypage/ZZim");
//        return modelAndView;
//    }
//@GetMapping("ZZim")
//public ModelAndView ZZim(HttpServletRequest request) {
//    ModelAndView modelAndView = new ModelAndView();
//    UserVo loginUser = (UserVo) request.getSession().getAttribute("loginUser");
//
//    if (loginUser == null) {
//        modelAndView.setViewName("redirect:/login");
//        return modelAndView;
//    }
//
//    try {
//        List<ZzimVo> list = us.getZZim(loginUser.getId());
//        modelAndView.addObject("ZZim", list);
//        modelAndView.setViewName("mypage/ZZim");
//    } catch (Exception e) {
//        modelAndView.setViewName("error/500");
//        e.printStackTrace();
//    }
//    return modelAndView;
//}


}
