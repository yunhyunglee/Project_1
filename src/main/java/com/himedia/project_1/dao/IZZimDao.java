package com.himedia.project_1.dao;

import com.himedia.project_1.dto.ZzimVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IZZimDao {
    List<ZzimVo> getZzimList(String userId);
}
