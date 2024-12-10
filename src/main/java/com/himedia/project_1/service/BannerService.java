package com.himedia.project_1.service;

import com.himedia.project_1.dao.IBannerDao;
import com.himedia.project_1.dto.BannerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerService {

    @Autowired
    private IBannerDao bannerDao;

    public List<BannerVo> getAllBanners() {
        return bannerDao.fetchAllBanners();
    }

    public List<BannerVo> getActiveBanners() {
        return bannerDao.fetchActiveBanners();
    }

    public BannerVo getBannerById(int bannerId) {
        return bannerDao.getBannerById(bannerId);
    }

    public void addBanner(BannerVo banner) {
        bannerDao.insertBanner(banner);
    }

    public void updateBanner(BannerVo banner) {
        bannerDao.updateBanner(banner);
    }

    public void deleteBanner(int bannerId) {
        bannerDao.deleteBanner(bannerId);
    }
}
