package com.himedia.project_1.service;


import com.himedia.project_1.dao.IReservationDao;
import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.ReservationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {

    @Autowired
    IReservationDao rdao;


    public List<ReservationVo> findAllReservation() {
        return rdao.findAllReservation();
    }



    public void deleteReservation(int reseq) {
        rdao.deleteReservation(reseq);
    }

    public List<ReservationVo> getReservations(int userId) {
        return rdao.getReservations(userId);
    }

    public void updatePaymentStatus(int reseq, String status) {
        rdao.updatePaymentStatus(reseq, status);
    }

    public List<ReservationVo> findByPaymentStatus(String status) {
        return rdao.findByPaymentStatus(status);
    }


    public int getFilteredReservationCount(String searchQuery, String status) {
        return rdao.getFilteredReservationCount(searchQuery, status);
    }

    public List<ReservationVo> getFilteredReservationList(String searchQuery, String status, int startNum, int displayRow) {
        return rdao.getFilteredReservationList(searchQuery, status, startNum, displayRow);
    }

}
