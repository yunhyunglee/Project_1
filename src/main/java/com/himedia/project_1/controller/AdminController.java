package com.himedia.project_1.controller;


import com.himedia.project_1.dto.*;
import com.himedia.project_1.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller

public class AdminController {

    private boolean isAuthenticated(HttpSession session) {
        return session.getAttribute("loginAdmin") != null;
    }

    @Autowired
    AdminService as;


    @GetMapping("/admin/adminMain")
    public String adminMain(HttpSession session, Model model) {
        if (!isAuthenticated(session)) {
            return "redirect:/admin";   // 어드민로그인안하고 들어오면 보내버리기~
        }
        return "admin/adminMain";
    }

    @GetMapping("/admin")
    public String admin() {
        return "admin/admin_loginForm";
    }

    @PostMapping("/adminLogin")
    public String adminlogin(@ModelAttribute("dto") @Valid AdminVo adminvo, BindingResult result,
                        HttpServletRequest request, Model model) {
        String url = "admin/admin_loginForm";
        if (result.hasErrors()) {
            if (result.getFieldError("aid") != null) {
                model.addAttribute("message", "아이디를 입력하세요");
                System.out.println("아이디 오류");
            } else if (result.getFieldError("pwd") != null) {
                model.addAttribute("message", "패스워드를 입력하세요");
                System.out.println("패스워드 오류");
            }
        } else {
            AdminVo avo = as.getAdmin(adminvo.getAid());
            System.out.println("Admin 조회 결과: " + (avo != null ? "성공" : "실패"));
            if (avo == null || !avo.getPwd().equals(adminvo.getPwd())) {
                model.addAttribute("message", "아이디 비번을 확인하세요");
                System.out.println("아이디 또는 비번 불일치");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("loginAdmin", avo);
                url = "redirect:/admin/adminMain";
                System.out.println("로그인 성공: " + adminvo.getAid());
            }
        }
        return url;
    }





    // qna
    @GetMapping("/admin/qna")
    public String getQnaList(Model model) {
        List<QnaVo> qnaList = as.getQnaList();
        System.out.println("qnaList= " + qnaList );
        model.addAttribute("qnaList", qnaList);
        return "admin/qna/qna";
    }

    // 회원 관리
    @GetMapping("/admin/user")
    public String getMemberList(Model model) {
        List<UserVo> userList = as.getMemberList();
        model.addAttribute("userList", userList);
        return "admin/user/user";
    }

    // 사업자 관리
    @GetMapping("/admin/business")
    public String getBusinessList(Model model) {
        List<BusinessmanVo> businessList = as.getBusinessList();
        model.addAttribute("businessList", businessList);
        return "admin/business/business";
    }



    // 공지사항 관리
    @GetMapping("/admin/notice")
    public String getNoticeList(Model model) {
        List<NoticeVo> noticeList = as.getNoticeList();
        model.addAttribute("noticeList", noticeList);
        return "admin/notice/notice";
    }


    @Autowired
    UserService us;
    // 회원 수정폼가기
    @GetMapping("/admin/user/get/{id}")
    @ResponseBody
    public UserVo getUser(@PathVariable String id) {
        System.out.println("userId = "  + id);
        return us.getUserById(id); // 특정 회원 정보 조회
    }

    // 사용자 정보 수정
    @PostMapping("/admin/user/update")
    public ResponseEntity<String> updateUser(@ModelAttribute UserVo user) {
        try {
            us.updateUser(user);
            return ResponseEntity.ok("회원 정보가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("회원 수정 중 문제가 발생했습니다.");
        }
    }

    @DeleteMapping("/admin/user/delete/{userId}")
    @ResponseBody
    public String deleteUser(@PathVariable String userId) {
        try {
            us.AdeleteUser(userId);
            return "회원이 성공적으로 삭제되었습니다.";
        } catch (Exception e) {
            return "회원 삭제 중 문제가 발생했습니다.";
        }
    }

    @Autowired
    private BusinessmanService bs;

    @GetMapping("/admin/business/get/{id}")
    @ResponseBody
    public BusinessmanVo getBusinessmanById(@PathVariable String id) {
        return bs.getBusinessmanById(id);
    }


    @PostMapping("/admin/business/update")
    public ResponseEntity<String> updateBusiness(@ModelAttribute BusinessmanVo businessman) {
        try {
            bs.updateBusiness(businessman);
            return ResponseEntity.ok("사업자회원 정보가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("사업자회원 수정 중 문제가 발생했습니다.");
        }
    }


    @DeleteMapping("/admin/business/delete/{id}")
    @ResponseBody
    public String deleteBusinessman(@PathVariable String id) {
        bs.deleteBusinessman(id);
        return "사업자가 삭제되었습니다.";
    }

    @Autowired
    NoticeService ns;

    @GetMapping("/admin/notice/get/{id}")
    @ResponseBody
    public NoticeVo getNoticeById(@PathVariable int id) {
        return ns.getNoticeById(id); // id에 해당하는 공지사항을 반환
    }


    @PostMapping("/admin/notice/update")
    public ResponseEntity<String> updateNotice(@ModelAttribute NoticeVo notice) {
        try {
            ns.updateNotice(notice);
            return ResponseEntity.ok("공지사항이 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("공지사항 수정 중 문제가 발생했습니다.");
        }
    }

    @DeleteMapping("/admin/notice/delete/{id}")
    @ResponseBody
    public String deleteNotice(@PathVariable int id) {
        try {
            ns.deleteNotice(id);
            return "공지사항이 성공적으로 삭제되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();
            return "공지사항 삭제 중 문제가 발생했습니다.";
        }
    }


    @PostMapping("/admin/notice/add")
    public ResponseEntity<String> addNotice(@ModelAttribute NoticeVo notice) {
        try {
            ns.addNotice(notice); // 서비스 호출
            return ResponseEntity.ok("공지사항이 성공적으로 추가되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("공지사항 추가 중 문제가 발생했습니다.");
        }
    }



    @Autowired
    private BannerService bannerService;

    // 배너 관리 페이지
    @GetMapping("/admin/banner")
    public String getBannerList(Model model) {
        List<BannerVo> banners = bannerService.getAllBanners();
        model.addAttribute("bannerList", banners);
        return "admin/banner/banner";
    }

    @GetMapping("/admin/banner/get/{bannerId}")
    @ResponseBody
    public BannerVo getBannerById(@PathVariable int bannerId) {
        BannerVo banner = bannerService.getBannerById(bannerId);
        if (banner == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Banner not found");
        }
        return banner;
    }


    // 배너 추가
    @PostMapping("/admin/banner/add")
    @ResponseBody
    public String addBanner(@ModelAttribute BannerVo banner) {
        bannerService.addBanner(banner);
        return "배너가 성공적으로 추가되었습니다.";
    }


    @PostMapping("/admin/banner/update")
    @ResponseBody
    public ResponseEntity<String> updateBanner(@ModelAttribute BannerVo banner) {
        try {
            bannerService.updateBanner(banner);
            return ResponseEntity.ok("{\"message\": \"배너가 성공적으로 수정되었습니다.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"error\": \"배너 수정 중 문제가 발생했습니다.\"}");
        }
        }



    @DeleteMapping("/admin/banner/delete/{bannerId}")
    @ResponseBody
    public String deleteBanner(@PathVariable int bannerId) {
        System.out.println("삭제요청배너아이디 : " + bannerId);
        try {
            bannerService.deleteBanner(bannerId);
            return "배너가 성공적으로 삭제되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();
            return "배너 삭제 중 문제가 발생했습니다.";
        }
    }


















}


