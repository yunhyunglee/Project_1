package com.himedia.project_1.controller;


import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.dto.ZzimVo;
import com.himedia.project_1.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    UserService us;

    @GetMapping("/customer")
    public String customer() {
        return "customer/customer";
    }

    @GetMapping("ZZim")
    public ModelAndView ZZim(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        UserVo loginUser = (UserVo) request.getSession().getAttribute("loginUser");
        List<ZzimVo>list=us.getZZim(loginUser.getId());
        modelAndView.addObject("ZZim", list);
        modelAndView.setViewName("mypage/ZZim");
        return modelAndView;
    }
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
