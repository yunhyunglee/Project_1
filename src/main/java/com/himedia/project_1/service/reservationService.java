package com.himedia.project_1.service;


import com.himedia.project_1.dao.IReservationDao;
import com.himedia.project_1.dto.ReservationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class reservationService {

    @Autowired
    IReservationDao rdao;


    public List<ReservationVo> findAllReservation() {
        return rdao.findAllReservation();
    }

    public List<ReservationVo> findByEndedClass(String endedClass) {
        return rdao.findByEndedClass(endedClass);
    }

    public List<ReservationVo> findCancelledReservation() {
        return rdao.findCancelledReservation();
    }

    public void deleteReservation(int reseq) {
        rdao.deleteReservation(reseq);
    }
}
