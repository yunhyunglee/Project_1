package com.himedia.project_1.service;

import com.himedia.project_1.dao.IQnaDao;
import com.himedia.project_1.dto.QnaVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaService {

    @Autowired
    IQnaDao iqnaDao;

    public void updateReply(int qseq, String reply) {
        iqnaDao.updateReply(qseq, reply);
    }

    public QnaVo getQnaById(int qseq) {
        return iqnaDao.findById(qseq);
    }




    public int getFilteredTotalCount(String filter, String searchQuery, String searchType) {
        return iqnaDao.getFilteredTotalCount(filter, searchQuery, searchType);
    }

    public List<QnaVo> getFilteredQnaList(String filter, String searchQuery, String searchType, int startNum, int displayRow) {
        return iqnaDao.getFilteredQnaList(filter, searchQuery, searchType, startNum, displayRow);
    }
}
