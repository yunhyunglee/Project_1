package com.himedia.project_1.controller;

import com.himedia.project_1.dto.BusinessmanVo;
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

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        mav.addObject("reviews",map.get("review"));
        mav.addObject("reviewopen",map.get("reviewopen"));
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

//    @GetMapping("/category")
//    public ModelAndView category(@RequestParam("category") int category) {
//        ModelAndView mav = new ModelAndView();
//        List<ProductVo> categoryProducts = ps.selectCategory(category);
//
//        // 데이터가 없을 경우 빈 리스트 반환
//        if (categoryProducts == null) {
//            categoryProducts = new ArrayList<>();
//        }
//
//        mav.addObject("categoryProduct", categoryProducts);
//        mav.setViewName("product/categoryProduct");
//        return mav;
//    }

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
                                    @RequestParam("selectedday")String day, @RequestParam("option2") String time,
                                    @RequestParam("people")int people, @RequestParam("cseq")int cseq) {

        UserVo loginUser = (UserVo) session.getAttribute("loginUser");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date classday = null;
        Time time1=null;
        try {
            time1=Time.valueOf(time);
            classday= sdf.parse(day);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        ps.insertReservation(loginUser.getId(),cseq,classday,time1,people);
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
    @GetMapping("able-capacity")
    @ResponseBody
    public String ableCapacity(@RequestParam("day")String day, @RequestParam("time") String time, Model model) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date classday = null;
        Time time1=null;
        try {
            time1=Time.valueOf(time);
            classday= sdf.parse(day);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        System.out.println(classday);
        System.out.println(time1);
        System.out.println(day);
        String ableCapacity= ps.calAbleCapacity(classday,time1);
        System.out.println("ableCapacity: " + ableCapacity);
        return ableCapacity;
    }



    @GetMapping("/category")
    public ModelAndView category(@RequestParam("category") int category) {
        ModelAndView mav = new ModelAndView();
        List<ProductVo> categoryProducts = ps.selectCategory(category);

        mav.addObject("categoryProduct", categoryProducts); // 카테고리 데이터 전달
        mav.setViewName("product/categoryProduct");
        return mav;
    }

    @GetMapping("/theme")
    public ModelAndView theme(@RequestParam("theme") int theme) {
        ModelAndView mav = new ModelAndView();
        List<ProductVo> themeProducts = ps.selectTheme(theme);

        mav.addObject("categoryProduct", themeProducts); // 테마 데이터 전달 (키는 유지 가능)
        mav.setViewName("product/themeProduct");
        return mav;
    }

    @GetMapping("review")
    public String review(@RequestParam("review") String review,
                         @RequestParam("rating")String rating,@RequestParam("cseq")int cseq,
                         @RequestParam("savefilename")String savefilename,HttpSession session) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        ps.insertReview(loginUser.getId(),cseq,rating, review,savefilename);
        return "redirect:/productDetail?id="+cseq;
    }

    @PostMapping("qnaProduct")
    public String review(@RequestParam("question")String content, HttpSession session,
                         @RequestParam("cseq")int cseq, @RequestParam("businessid")String businessid) {
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        ps.insertqnaproduct(loginUser.getId(),businessid,content,cseq);
        return "redirect:/productDetail?id="+cseq;
    }
    @GetMapping("MyQnaProduct")
    @ResponseBody
    public HashMap<String,Object> myQnaProduct(HttpSession session) {
        BusinessmanVo loginUser = (BusinessmanVo) session.getAttribute("loginUser");
        HashMap<String,Object> map = ps.getMyQnaProduct(loginUser.getId());
        return map;
    }


//    @GetMapping("/theme")
//    public ModelAndView theme(@RequestParam("theme") int theme) {
//        ModelAndView mav = new ModelAndView();
//        List<ProductVo> categoryProducts = ps.selectCategory(theme);
//
//        // 데이터가 없을 경우 빈 리스트 반환
//        if (categoryProducts == null) {
//            categoryProducts = new ArrayList<>();
//        }
//
//        mav.addObject("categoryProduct", categoryProducts);
//        mav.setViewName("product/categoryProduct");
//        return mav;
//    }







}

