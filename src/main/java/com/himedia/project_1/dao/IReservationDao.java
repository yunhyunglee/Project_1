package com.himedia.project_1.dao;


import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.ReservationVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface IReservationDao {

//    어드민 예약관리
    List<ReservationVo> findAllReservation();

    void deleteReservation(int reseq);

    List<ReservationVo> getReservations(int userId);

    void updatePaymentStatus(int reseq, String status);

    List<ReservationVo> findByPaymentStatus(String status);

    int getFilteredReservationCount(@Param("searchQuery") String searchQuery, @Param("status") String status);

    List<ReservationVo> getFilteredReservationList(@Param("searchQuery") String searchQuery,
                                                   @Param("status") String status,
                                                   @Param("startNum") int startNum,
                                                   @Param("displayRow") int displayRow);


}
