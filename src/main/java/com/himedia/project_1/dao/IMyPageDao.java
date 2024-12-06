package com.himedia.project_1.dao;

import com.himedia.project_1.dto.ProductVo;
import com.himedia.project_1.dto.ReservationVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMyPageDao {

    List<ProductVo> getMyClassInfo(String id);

    List<ReservationVo> selectTotalPrice(String id);
}
