package com.himedia.project_1.service;

import com.himedia.project_1.dao.IReservationDao;
import com.himedia.project_1.dto.ReservationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {
    @Autowired
    private IReservationDao IRdao;

    public List<ReservationVo> getReservations(int userId) {
        return IRdao.getReservations(userId);
    }
}
