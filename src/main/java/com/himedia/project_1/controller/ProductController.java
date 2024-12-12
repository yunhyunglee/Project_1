package com.himedia.project_1.controller;

import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductService ps;

    @GetMapping("/productDetail")
    public ModelAndView productDetail(HttpSession session,@RequestParam("id")int cseq) {
        ModelAndView mav = new ModelAndView("product/productDetail");
        UserVo loginUser = (UserVo) session.getAttribute("loginUser");
        boolean zzim=false;
        ProductVo productVo=ps.getProductById(cseq);
        if(loginUser != null) {
           zzim= ps.getZzim(loginUser.getId(),cseq);
        }
        mav.addObject("loginUser",loginUser);
        mav.addObject("zzim",zzim);
        mav.addObject("productVo",productVo);
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

//    @GetMapping("/detail/{cseq}")
//    public String getProductDetail(@PathVariable int cseq, Model model) {
//        ProductVo product = ps.getProductById(cseq); // cseq로 상품 조회
//        if (product == null) {
//            return "error/404"; // 상품이 없으면 404 페이지로 이동
//        }
//        model.addAttribute("productVo", product);
//        return "product/productDetail"; // 상세 페이지로 이동
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


}

