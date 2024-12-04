package com.himedia.project_1.dao;

import com.himedia.project_1.dto.BusinessmanVo;
import com.himedia.project_1.dto.UserVo;
import com.himedia.project_1.dto.ZzimVo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IUserDao {

    void InsertUser(UserVo uvo);
    UserVo getUser(String userid);

    void updateUser(UserVo uservo);

    void InsertBusinessman(BusinessmanVo uservo);

    BusinessmanVo getBusinessman(String userid);

    void updateBusiness(BusinessmanVo uservo);

    void deleteuser(@NotEmpty @NotNull String id);

    void deleteBusiness(String id);

    List<ZzimVo> getZZim(String id);

    List<ReviewVo> getMyReview(String id);
}
