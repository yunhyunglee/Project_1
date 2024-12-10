package com.himedia.project_1.controller;

import com.google.gson.Gson;
import com.himedia.project_1.dto.*;
import com.himedia.project_1.service.ProductService;
import com.himedia.project_1.service.UserService;
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
import org.springframework.web.servlet.ModelAndView;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService us;
    @Autowired
    ProductService ps;


    @GetMapping("/")
    public String home(Model model) {
        List<ProductVo> bestProducts = ps.getBestProducts();
        List<ProductVo> newProducts = ps.getNewProducts();

        // 전달할 데이터가 null인지 확인
        if (bestProducts == null || newProducts == null) {
            throw new RuntimeException("Product lists are null!");
        }

        model.addAttribute("bestProducts", bestProducts);
        model.addAttribute("newProducts", newProducts);
        return  "index";

    }


    @GetMapping("joinform")
    public String joinform() {
        return "member/contract";
    }


    @GetMapping("userjoinform")
    public String userjoinform() { return "member/userjoin";}

    @GetMapping("businessjoinform")
    public String businessjoinform() {        return "member/businessjoin";}


    @PostMapping("join")
    public String join(@ModelAttribute("dto") @Valid UserVo uservo, BindingResult result, @RequestParam("pwdchk") String pwdchk,@RequestParam("reid")String reid, Model model) {
        String url = "member/userjoin";

        if (result.getFieldError("id") != null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "비밀번호를 입력하세요");
        else if (result.getFieldError("name") != null)
            model.addAttribute("message", "이름을 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("message", "이메일을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("message", "전화번호를 입력하세요");
        else if (!uservo.getId().equals(reid))
            model.addAttribute("message", "아이디 중복검사하세요");
        else if (uservo.getPwd().equals(pwdchk)) {
            us.InsertUser(uservo);
            model.addAttribute("message", "가입 완료");
            url = "member/loginForm";
        }
        return url;
    }

    @PostMapping("businessjoin")
    public String businessjoin(@ModelAttribute("dto") @Valid BusinessmanVo businessmanvo, BindingResult result, @RequestParam("pwdchk") String pwdchk,@RequestParam("reid")String reid, Model model) {
        String url = "member/businessjoin";

        if (result.getFieldError("id") != null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "비밀번호를 입력하세요");
        else if (result.getFieldError("name") != null)
            model.addAttribute("message", "이름을 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("message", "이메일을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("message", "전화번호를 입력하세요");
        else if (!businessmanvo.getId().equals(reid))
            model.addAttribute("message", "아이디 중복검사하세요");
        else if (businessmanvo.getPwd().equals(pwdchk)) {
            us.InsertBusinessman(businessmanvo);
            model.addAttribute("message", "가입 완료");
            url = "member/loginForm";
        }
        return url;
    }

    @GetMapping("loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto") @Valid UserVo uservo, BindingResult result,
                        HttpServletRequest request,@RequestParam("usertype")String usertype, Model model) {
        String url = "member/loginForm";
        if (result.getFieldError("id") != null) {
            model.addAttribute("message", "아이디를 입력하세요");
            System.out.println("오류");
        } else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else {
            if(usertype.equals("1")){
                UserVo uvo = us.getMember(uservo.getId());
                if (uvo == null)
                    model.addAttribute("message", "아이디 비번을 확인하세요");
                else if (!uvo.getPwd().equals(uservo.getPwd()))
                    model.addAttribute("message", "아이디 비번을 확인하세요");
                else if (uvo.getPwd().equals(uservo.getPwd())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("loginUser", uvo);
                    url = "redirect:/";
                }
            }else if (usertype.equals("2")){
                    BusinessmanVo bvo = us.getBusinessman(uservo.getId());
                if (bvo == null)
                    model.addAttribute("message", "아이디 비번을 확인하세요");
                else if (!bvo.getPwd().equals(uservo.getPwd()))
                    model.addAttribute("message", "아이디 비번을 확인하세요");
                else if (bvo.getPwd().equals(uservo.getPwd())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("loginUser", bvo);
                    url = "redirect:/";
                }
            }
        }
        return url;
    }

    @GetMapping("/kakaoLogin")
    public String kakaoLogin(HttpServletRequest request, Model model) throws IOException {
        String code = request.getParameter("code");

        // Step 1: Access Token 요청
        String endpoint = "https://kauth.kakao.com/oauth/token";
        URL url = new URL(endpoint);
        String bodyData = "grant_type=authorization_code";
        bodyData += "&client_id=e5361337566dff569bd6c1d524155311";
        bodyData += "&redirect_uri=http://localhost:8070/kakaoLogin";
        bodyData += "&code=" + code;

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setDoOutput(true);

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
        bw.write(bodyData);
        bw.flush();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        String input;
        StringBuilder sb = new StringBuilder();
        while ((input = br.readLine()) != null) {
            sb.append(input);
        }

        Gson gson = new Gson();
        OAuthToken oAuthToken = gson.fromJson(sb.toString(), OAuthToken.class);

        // Step 2: 사용자 정보 요청
        endpoint = "https://kapi.kakao.com/v2/user/me";
        url = new URL(endpoint);
        conn = (HttpsURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization", "Bearer " + oAuthToken.getAccess_token());
        conn.setDoOutput(true);

        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        sb = new StringBuilder();
        while ((input = br.readLine()) != null) {
            sb.append(input);
        }

        KakaoProfile kakaoProfile = gson.fromJson(sb.toString(), KakaoProfile.class);

        // Step 3: 사용자 DB 확인
        UserVo uvo = us.getMember(kakaoProfile.getId());
        if (uvo == null) {
            // 신규 사용자: 비밀번호 입력 페이지로 이동
            model.addAttribute("kakaoId", kakaoProfile.getId());
            model.addAttribute("email", kakaoProfile.getAccount().getEmail());
            model.addAttribute("name", kakaoProfile.getAccount().getProfile().getNickname());
            return "member/kakao"; // 비밀번호 입력 페이지
        }

        // 기존 사용자: 로그인 처리
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", uvo);
        return "redirect:/";
    }

    @PostMapping("/kakaoJoin")
    public String kakaoJoin(@RequestParam("kakaoId") String kakaoId,
                            @RequestParam("pwd") String pwd,
                            @RequestParam("email") String email,
                            @RequestParam("name") String name,
                            HttpSession session) {
        UserVo newUser = new UserVo();
        newUser.setId(kakaoId);
        newUser.setPwd(pwd); // 비밀번호 암호화 필요 시 추가 처리
        newUser.setEmail(email);
        newUser.setName(name);

        us.InsertUser(newUser);
        session.setAttribute("loginUser", newUser);

        return "redirect:/";
    }


    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return "redirect:/";
    }
    @GetMapping("mypage")
    public String mypage(HttpSession session,Model model) {
        Object loginUser = session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/loginForm";
        }else if(loginUser instanceof UserVo) {
            model.addAttribute("user", "1");
        }else if(loginUser instanceof BusinessmanVo) {
            model.addAttribute("user", "2");
        }
        return "mypage/MyPage";
    }

    @GetMapping("updateUserForm")
    public ModelAndView mypage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        Object loginUser = request.getSession().getAttribute("loginUser");
        if (loginUser instanceof UserVo) {
            // UserVo인 경우
            UserVo user = (UserVo) loginUser;
            mav.addObject("dto", us.getMember(user.getId()));
            mav.setViewName("mypage/UserUpdate");
        } else if (loginUser instanceof BusinessmanVo) {
            // businessmanVo인 경우
            BusinessmanVo businessMan = (BusinessmanVo) loginUser;
            mav.addObject("dto", us.getBusinessman(businessMan.getId()));
            mav.setViewName("mypage/BusinessUpdate");
        } else {
            // 그 외의 경우나 에러 처리
            mav.setViewName("index2");
        }

        return mav;
    }

    @PostMapping("updateUser")
    public String updateUser(@ModelAttribute("dto")@Valid UserVo uservo, BindingResult result,@RequestParam("pwdchk")String pwdchk, Model model, HttpSession session) {

        String url = "mypage/UserUpdate";
        if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "비밀번호를 입력하세요");
        else if (!uservo.getPwd().equals(pwdchk))
            model.addAttribute("message", "비밀번호체크를 확인하세요");
        else if (result.getFieldError("name") != null)
            model.addAttribute("message", "이름을 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("message", "이메일을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("message", "전화번호를 입력하세요");
        else if (uservo.getPwd().equals(pwdchk)) {

            us.updateUser(uservo);
            session.setAttribute("loginUser", uservo);
            url = "redirect:/";
        }
        return url;
    }
    @PostMapping("updateBusiness")
    public String updateBusiness(@ModelAttribute("dto")@Valid BusinessmanVo uservo, BindingResult result,@RequestParam("pwdchk")String pwdchk, Model model, HttpSession session   ) {
        String url = "mypage/BusinessUpdate";
        if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "비밀번호를 입력하세요");
        else if (!uservo.getPwd().equals(pwdchk))
            model.addAttribute("message", "비밀번호체크를 확인하세요");
        else if (result.getFieldError("name") != null)
            model.addAttribute("message", "이름을 입력하세요");
        else if (result.getFieldError("email") != null)
            model.addAttribute("message", "이메일을 입력하세요");
        else if (result.getFieldError("phone") != null)
            model.addAttribute("message", "전화번호를 입력하세요");
        else if (uservo.getPwd().equals(pwdchk)) {

            us.updateBusiness(uservo);
            session.setAttribute("loginUser", uservo);
            url = "redirect:/";
        }
        return url;
    }
    @PostMapping("/idcheck")
    @ResponseBody  // 현재  response 가 있는 페이지로 이동
    public HashMap<String, Object> idcheck(@RequestParam("id") String userid, @RequestParam("usertype")String usertype) {
        UserVo uvo = us.getMember(userid);
        BusinessmanVo bvo = us.getBusinessman(userid);
        HashMap<String, Object> result = new HashMap<>();
        if( (uvo == null && usertype.equals("1"))||(bvo==null&&usertype.equals("2"))){
            result.put("idmessage", 1);
            result.put("id", userid);
        }else{
            result.put("idmessage", -1);
        }
        return result;
    }

    @GetMapping("deleteUserForm")
    public String deleteUser(Model model, HttpSession session) {
        Object loginUser = session.getAttribute("loginUser");
        if (loginUser instanceof UserVo) {
            UserVo user = (UserVo) loginUser;
            model.addAttribute("dto", us.getMember(user.getId()));
        }else if(loginUser instanceof BusinessmanVo) {
            BusinessmanVo businessMan = (BusinessmanVo) loginUser;
            model.addAttribute("dto", us.getBusinessman(businessMan.getId()));
        }
        return "mypage/UserDelete";
    }
    @PostMapping("deleteUser")
    public String deleteUser(HttpServletRequest request, HttpSession session) {
        Object loginUser = request.getSession().getAttribute("loginUser");
        if (loginUser instanceof UserVo) {
            // UserVo인 경우
            UserVo user = (UserVo) loginUser;
            us.deleteuser(user.getId());
        } else if (loginUser instanceof BusinessmanVo) {
            // businessmanVo인 경우
            BusinessmanVo businessMan = (BusinessmanVo) loginUser;
            us.deleteBusiness(businessMan.getId());
        }
        session.removeAttribute("loginUser");
        return "redirect:/";
    }

}
