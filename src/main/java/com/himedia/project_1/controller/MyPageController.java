package com.himedia.project_1.controller;

import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.ReservationVo;
import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.service.MyPageService;
import com.himedia.project_1.service.UserService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Controller
public class MyPageController {
    @Autowired
    UserService us;


    @GetMapping("MyReview")
    public ModelAndView myReview(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Object loginuser0= session.getAttribute("loginUser");
        if (loginuser0 instanceof UserVo) {
            // UserVo인 경우
            UserVo loginuser = (UserVo) loginuser0;
            mav.addObject("MyReview", us.getMyReview(loginuser.getId()));
        } else if (loginuser0 instanceof BusinessmanVo) {
            // businessmanVo인 경우
            BusinessmanVo loginuser = (BusinessmanVo) loginuser0;
            mav.addObject("MyReview", us.getMyReview(loginuser.getId()));
        }
        mav.setViewName("mypage/MyReview");
        return mav;
    }

    @GetMapping("MyReservation")
    public ModelAndView myReservation(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Object loginuser0=session.getAttribute("loginUser");
        if (loginuser0 instanceof UserVo) {
            // UserVo인 경우
            UserVo loginuser = (UserVo) loginuser0;
            mav.addObject("MyReservation", us.getMyReservation(loginuser.getId()));
        } else if (loginuser0 instanceof BusinessmanVo) {
            // businessmanVo인 경우
            BusinessmanVo loginuser = (BusinessmanVo) loginuser0;
            mav.addObject("MyReservation", us.getMyReservation(loginuser.getId()));
        }
        mav.setViewName("mypage/MyReservation");
        return mav;
    }

    @GetMapping("myQna")
    public ModelAndView myQna(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Object loginuser0= session.getAttribute("loginUser");
        if (loginuser0 instanceof UserVo) {
            // UserVo인 경우
            UserVo loginuser = (UserVo) loginuser0;
            mav.addObject("MyQna", us.getMyQna(loginuser.getId()));
        } else if (loginuser0 instanceof BusinessmanVo) {
            // businessmanVo인 경우
            BusinessmanVo loginuser = (BusinessmanVo) loginuser0;
            mav.addObject("MyQna", us.getMyQna(loginuser.getId()));
        }
        mav.setViewName("mypage/MyQna");
        return mav;
    }
    @Autowired
    MyPageService ms;
    @GetMapping("MyClass")
    public ModelAndView myClass(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        BusinessmanVo loginuser = (BusinessmanVo) session.getAttribute("loginUser");
        List<ReservationVo> list=ms.getMyClassInfo(loginuser.getId());
        mav.addObject("MyClass", list);
        mav.setViewName("mypage/MyClass");
        return mav;
    }
    @GetMapping("Reservation_List")
    public ModelAndView reservationDetails(HttpSession session, @RequestParam("cseq")String cseq) {
        ModelAndView mav = new ModelAndView();
//        BusinessmanVo loginuser=(BusinessmanVo) session.getAttribute("loginUser");
        List<ReservationVo> list=ms.selectReservListDay(cseq);
        mav.addObject("reservList", list);
        mav.setViewName("mypage/Reservation_DetailList");
        return mav;
    }

    @GetMapping("reservation_cancle")
    public String reservationCancel(HttpSession session, @RequestParam("reseq")String reseq) {
        int cseq=ms.reservationCancel(reseq);

        return "redirect:/Reservation_List?cseq="+cseq;
    }
    @GetMapping("NewProduct")
    public ModelAndView newProduct(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        BusinessmanVo loginuser = (BusinessmanVo) session.getAttribute("loginUser");
        mav.addObject("dto", loginuser);
        mav.setViewName("mypage/NewProduct");
        return mav;
    }

    @PostMapping("insertNewProduct")
    public String insertNewProduct(@ModelAttribute("dto")ProductVo productvo, @RequestParam("selectedTime")List<String>selectedtimes){
        String url="";
        ms.insertNewProduct(productvo,selectedtimes);

        url="redirect:/MyClass";
        return url;
    }


    @Autowired
    ServletContext context;
    @PostMapping("/fileup")
    @ResponseBody
    public HashMap<String, Object> fileup(@RequestParam("fileimage") MultipartFile file){
        String path = context.getRealPath("/product_images");

        Calendar today = Calendar.getInstance();
        long t = today.getTimeInMillis();
        String filename = file.getOriginalFilename();
        String fn1 = filename.substring(0, filename.indexOf("."));  // 파일 이름과 확장자 분리
        String fn2 = filename.substring(filename.indexOf("."));
        String savefilename = fn1 + t + fn2;
        String uploadPath = path + "/" + savefilename;

        HashMap<String, Object> result = new HashMap<String, Object>();

        try{
            file.transferTo(new File(uploadPath));  // 파일의 업로드 + 저장
            result.put("image", filename);
            result.put("savefilename", savefilename);
        }catch (IllegalStateException e){ e.printStackTrace();
        }catch (IOException e){ e.printStackTrace();
        }
        return result;
    }

    @GetMapping("ClassinfoUpdate")
    public ModelAndView classinfoUpdate(HttpSession session,@RequestParam("cseq")int cseq) {
        ModelAndView mav = new ModelAndView();
        BusinessmanVo loginuser = (BusinessmanVo) session.getAttribute("loginUser");
        ProductVo pvo=ms.selectProductbycseq(cseq);
        List<String>times= ms.selectedtimes(cseq);
        mav.addObject("stimes", times);
        mav.addObject("pvo", pvo);
        mav.addObject("dto", loginuser);
        mav.setViewName("mypage/UpdateProduct");
        return mav;
    }

    @PostMapping("UpdateProduct")
    public String UpdateProduct(@ModelAttribute("pvo")ProductVo productvo, @RequestParam("selectedTime")List<String>selectedtimes){
        ms.UpdateProduct(productvo,selectedtimes);
        return "redirect:/MyClass";
    }
    @PostMapping("deleteProduct")
    public String deleteButton(@RequestParam("cseq")int cseq){
        ms.deleteProduct(cseq);
        return "redirect:/MyClass";
    }
    @GetMapping("clearpay")
    public String clearpay(@RequestParam("cseq") int cseq){
        System.out.println("cseq = "+cseq);
        ms.clearpay(cseq);
        return "redirect:/MyClass";
    }

}
