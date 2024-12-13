package com.himedia.project_1.controller;

import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.ReservationVo;
import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductService ps;

    @GetMapping("/productDetail")
    public ModelAndView productDetail(@ModelAttribute("dto")  ReservationVo reservationvo, BindingResult result, HttpSession session, @RequestParam("id")int cseq) {
        System.out.println(cseq);
        ModelAndView mav = new ModelAndView("product/productDetail");

        Object loginUser = session.getAttribute("loginUser");
        HashMap<String,Object> map = ps.getZzim(loginUser,cseq);
        if(loginUser != null && loginUser instanceof UserVo) {
            UserVo userVo=(UserVo)loginUser;
            mav.addObject("loginUser",userVo);
        }
        System.out.println(map.get("zzim"));
        mav.addObject("zzim",map.get("zzim"));
        mav.addObject("productVo",map.get("productVo"));
        mav.addObject("classTime",map.get("classTime"));
        return mav;
    }
    @GetMapping("toggleHeart")
    @ResponseBody
    public HashMap<String,Object> toggleHeart(HttpSession session,@RequestParam("cseq")int cseq) {
        System.out.println(cseq);
        HashMap<String,Object> map = new HashMap<>();
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        boolean zzim=false;
        if(loginUser != null) {
            zzim=ps.toggleZzim(loginUser.getId(),cseq);

        }
        map.put("loginUser",loginUser);
        map.put("zzim",zzim);
        return map;
    }

    @GetMapping("/category")
    public ModelAndView category(@RequestParam("category") int category) {
        ModelAndView mav = new ModelAndView();
        List<ProductVo> categoryProducts = ps.selectCategory(category);

        // 데이터가 없을 경우 빈 리스트 반환
        if (categoryProducts == null) {
            categoryProducts = new ArrayList<>();
        }

        mav.addObject("categoryProduct", categoryProducts);
        mav.setViewName("product/categoryProduct");
        return mav;
    }

    @GetMapping("/detail/{cseq}")
    public String getProductDetail(@PathVariable int cseq, Model model) {
        System.out.println("Received cseq: " + cseq); // 로그 출력
        ProductVo product = ps.getProductById(cseq);
        if (product == null) {
            System.out.println("Product not found for cseq: " + cseq);
            return "error/404"; // 상품이 없으면 404 페이지로 이동
        }
        model.addAttribute("productVo", product);
        return "product/productDetail";
    }
    @PostMapping("insertReservation")
    public String insertReservation(@ModelAttribute("dto") ReservationVo reservationvo, HttpSession session,
                                    @RequestParam("option1")String month, @RequestParam("option12")String day, @RequestParam("option2")int time,
                                    @RequestParam("people")int people, @RequestParam("cseq")int cseq) {
        System.out.println("month: " + month);
        System.out.println("day: " + day);
        System.out.println("time: " + time);
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        String classday="2024-"+month+"-"+day;
        ps.insertReservation(loginUser.getId(),cseq,classday,time,people);
        return "redirect:/productDetail?id="+cseq;
    }

    @GetMapping("search")
    public ModelAndView search(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("product/ProductSearch");
        HashMap<String, Object> map = ps.getSearchList(request);
        HttpSession session = request.getSession();

        mav.addObject("SearchProduct",map.get("SearchList"));
        mav.addObject("paging", map.get("paging"));
        mav.addObject("key", map.get("key"));
        return mav;
    }




}

