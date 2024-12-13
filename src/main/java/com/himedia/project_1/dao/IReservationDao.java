package com.himedia.project_1.dao;


import com.himedia.project_1.dto.ReservationVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface IReservationDao {

//    어드민 예약관리
    List<ReservationVo> findAllReservation();
    List<ReservationVo> findByEndedClass(String endedClass);
    List<ReservationVo> findCancelledReservation();
    void deleteReservation(int reseq);

    List<ReservationVo> getReservations(int userId);
}
