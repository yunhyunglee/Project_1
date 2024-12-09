package com.himedia.project_1.service;


import com.himedia.project_1.dao.*;
import com.himedia.project_1.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    IAdminDao adao;
    @Autowired
    private IQnaDao qnaDao;

    @Autowired
    private IUserDao userDao;

    @Autowired
    private IBusinessmanDao businessmanDao;

    @Autowired
    private IBannerDao bannerDao;

    @Autowired
    private INoticeDao noticeDao;

    public AdminVo getAdmin(String aid) {
        return adao.getAdmin(aid);
    }



    // QnA 목록 가져오기
    public List<QnaVo> getQnaList() {
        List<QnaVo> qnaList = qnaDao.fetchQnaList();
        System.out.println("Fetched QnA List: " + qnaList);
        return qnaList;
    }

    // 회원 목록 가져오기
    public List<UserVo> getMemberList() {
        List<UserVo> userList = userDao.fetchUserList();
        return userList;
    }

    // 사업자 목록 가져오기
    public List<BusinessmanVo> getBusinessList() {
        List<BusinessmanVo> businessList = businessmanDao.fetchBusinessList();
        return businessList;
    }



    // 공지사항 목록 가져오기
    public List<NoticeVo> getNoticeList() {
       List<NoticeVo> noticeList = noticeDao.fetchNoticeList();
       return noticeList;
    }





}






