package com.himedia.project_1.dao;


import com.himedia.project_1.dto.BannerVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IBannerDao {
    // 모든 배너 조회
    List<BannerVo> fetchAllBanners();

    // 활성화된 배너만 조회
    List<BannerVo> fetchActiveBanners();

    // 특정 배너 조회
    BannerVo getBannerById(int bannerId);

    // 배너 추가
    void insertBanner(BannerVo banner);

    // 배너 수정
    void updateBanner(BannerVo banner);

    // 배너 삭제
    void deleteBanner(int bannerId);
}
