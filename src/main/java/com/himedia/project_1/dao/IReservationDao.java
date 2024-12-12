package com.himedia.project_1.dao;

import com.himedia.project_1.dto.ReservationVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface IReservationDao {
    List<ReservationVo> getReservations(int userId);
}
