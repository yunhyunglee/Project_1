package com.himedia.project_1.service;

import com.himedia.project_1.dao.INoticeDao;
import com.himedia.project_1.dto.NoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

    @Autowired
    INoticeDao ndao;

    public void updateNotice(NoticeVo notice) {
        ndao.updateNotice(notice);

    }

    public void deleteNotice(int id) {
        ndao.deleteNotice(id);
    }

    public NoticeVo getNoticeById(int id) {
        return ndao.getNoticeById(id);
    }

    public void addNotice(NoticeVo notice) {
        ndao.addNotice(notice);
    }
}
