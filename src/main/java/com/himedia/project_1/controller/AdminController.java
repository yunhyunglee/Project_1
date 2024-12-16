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
import java.util.Map;

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

        AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
        if (loginAdmin != null) {
            model.addAttribute("adminName", loginAdmin.getAid()); // 어드민 아이디 전달
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

    // 어드민 회원관리 : 회원삭제
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

    // 어드민 사업자관리 : 사업자 상세보기
    @GetMapping("/admin/business/get/{id}")
    @ResponseBody
    public BusinessmanVo getBusinessmanById(@PathVariable String id) {
        return bs.getBusinessmanById(id);
    }
    @GetMapping("/admin/business/{id}/products")
    @ResponseBody
    public List<ProductVo> getProductsByBusinessId(@PathVariable String id) {
        return productService.getProductsByBusinessId(id);
    }


    // 어드민 사업자관라 : 사업자 수정
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


    // 어드민 사업자관라 : 사업자 삭제
    @DeleteMapping("/admin/business/delete/{id}")
    @ResponseBody
    public String deleteBusinessman(@PathVariable String id) {
        bs.deleteBusinessman(id);
        return "사업자가 삭제되었습니다.";
    }

    @Autowired
    NoticeService ns;

    // 어드민 공지사항관라 : 공지사항 상세보기
    @GetMapping("/admin/notice/get/{id}")
    @ResponseBody
    public NoticeVo getNoticeById(@PathVariable int id) {
        return ns.getNoticeById(id);
    }

    // 어드민 공지사항관라 : 공지사항 수정
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


    // 어드민 공지사항관라 : 공지사항 삭제
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


    // 어드민 공지사항관라 : 공지사항 추가
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

    // 어드민 배너관라 : 배너목록
    @GetMapping("/admin/banner")
    public String getBannerList(Model model) {
        List<BannerVo> banners = bannerService.getAllBanners();
        model.addAttribute("bannerList", banners);
        return "admin/banner/banner";
    }

    // 어드민 배너관라 : 배너 상세보기
    @GetMapping("/admin/banner/get/{bannerId}")
    @ResponseBody
    public BannerVo getBannerById(@PathVariable int bannerId) {
        BannerVo banner = bannerService.getBannerById(bannerId);
        if (banner == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Banner not found");
        }
        return banner;
    }


    // 어드민 배너관라 : 배너 추기
    @PostMapping("/admin/banner/add")
    @ResponseBody
    public String addBanner(@ModelAttribute BannerVo banner) {
        bannerService.addBanner(banner);
        return "배너가 성공적으로 추가되었습니다.";
    }

    // 어드민 배너관라 : 배너 수정
    @PostMapping("/admin/banner/update")
    @ResponseBody
    public ResponseEntity<String> updateBanner(@ModelAttribute BannerVo banner) {
        System.out.println("Received Banner Data: " + banner); // 디버깅용 출력
        try {
            bannerService.updateBanner(banner);
            return ResponseEntity.ok("배너가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("배너 수정 중 문제가 발생했습니다.");
        }
    }




    // 어드민 배너관라 : 배너 삭제
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

// 활성화 배너 가져오깅
    @GetMapping("/activeBanners")
    @ResponseBody
    public List<BannerVo> getActiveBanners() {
        return bannerService.getActiveBanners();
    }




    @Autowired
    private QnaService qnaService;

    // 어드민QnA관리 : QnA상세보기
    @GetMapping("/admin/qna/get/{qseq}")
    public ResponseEntity<QnaVo> getQnaDetail(@PathVariable int qseq) {
        QnaVo qna = qnaService.getQnaById(qseq);
        return ResponseEntity.ok(qna);
    }

    // 어드민QnA관라 : 답변달기
    @PostMapping("/admin/qna/reply")
    public ResponseEntity<?> saveReply(@RequestBody Map<String, Object> requestData) {
        int qseq = (int) requestData.get("qseq");
        String reply = (String) requestData.get("reply");
        qnaService.updateReply(qseq, reply);
        return ResponseEntity.ok().build();
    }


@Autowired
ReservationService reservationService;

    // 어드민예약관라 : 예약 목록
    @GetMapping("/admin/reservation")
    public String listReservation(@RequestParam(value = "status", required = false) String status, Model model) {
        List<ReservationVo> reservationList;
            reservationList = reservationService.findAllReservation();
        model.addAttribute("reservationList", reservationList);
        return "/admin/reservation/reservation";
    }

    // 어드민예약관라 : 예약삭제
    @DeleteMapping("/admin/reservation/delete/{reseq}")
    public ResponseEntity<Void> deleteReservation(@PathVariable int reseq) {
        reservationService.deleteReservation(reseq);
        return ResponseEntity.ok().build();
    }


    // 어드민예약관라 : 필터링처리
    @GetMapping("/admin/reservation/filter")
    @ResponseBody
    public List<ReservationVo> filterReservations(@RequestParam(value = "status", required = false) String status) {
        if (status == null || status.isEmpty()) {
            return reservationService.findAllReservation();
        } else if ("in_progress".equals(status)) {
            return reservationService.findByEndedClass("N");
        } else if ("completed".equals(status)) {
            return reservationService.findByEndedClass("Y");
        } else if ("cancelled".equals(status)) {
            return reservationService.findCancelledReservation();
        }
        return reservationService.findAllReservation();
    }



    @Autowired
    private ProductService productService;

    @GetMapping("/admin/product")
    public String getProductList(Model model) {
        List<ProductVo> productList = productService.getAllProducts();
        model.addAttribute("productList", productList);
        return "admin/product/product"; // JSP 파일 경로
    }

    @PostMapping("/admin/product/add")
    public String addProduct(@ModelAttribute ProductVo product) {
        productService.addProduct(product);
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(@ModelAttribute ProductVo product) {
        productService.updateProduct(product);
        return "redirect:/admin/product";
    }

    @DeleteMapping("/admin/product/delete/{productId}")
    @ResponseBody
    public String deleteProduct(@PathVariable int productId) {
        try {
            productService.deleteProduct(productId);
            return "상품이 성공적으로 삭제되었습니다.";
        } catch (Exception e) {
            e.printStackTrace();
            return "상품 삭제 중 문제가 발생했습니다.";
        }
    }







}


