package com.himedia.project_1.controller;

import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.ReservationVo;
import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.service.MyPageService;
import com.himedia.project_1.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

}
