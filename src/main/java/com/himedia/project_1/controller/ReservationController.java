package com.himedia.project_1.controller;

import com.himedia.project_1.dto.ReservationVo;
import com.himedia.project_1.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ReservationController {

    @Autowired
    private ReservationService rs;

    @GetMapping("/mypage/reservations")
    public String getMyReservations(@RequestParam("userId") int userId, Model model) {
        List<ReservationVo> reservations = rs.getReservations(userId);
        model.addAttribute("MyReservation", reservations);
        return "mypage/MyReservation";
    }
}
