package com.himedia.project_1.dao;

import com.himedia.project_1.dto.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

    List<ReservationVo> getMyReservation(String id);

    List<QnaVo> getMyQna(String id);



    void updateUserWithPassword(UserVo uvo);

    List<UserVo> fetchUserList();


    // admin이 유저지우기임
    void deleteUser(String userId);

    // admin 유저수정
    UserVo getUserById(String userId);

    List<ProductVo> getBest();

    List<ProductVo> getNew();


    int getFilteredTotalCount(@Param("searchQuery") String searchQuery, @Param("searchType") String searchType);

    List<UserVo> getFilteredUserList(@Param("searchQuery") String searchQuery,
                                     @Param("searchType") String searchType,
                                     @Param("startNum") int startNum,
                                     @Param("displayRow") int displayRow);

}
