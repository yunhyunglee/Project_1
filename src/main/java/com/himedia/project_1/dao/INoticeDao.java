package com.himedia.project_1.dao;

import com.himedia.project_1.dto.NoticeVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface INoticeDao {


    List<NoticeVo> fetchNoticeList();

    void updateNotice(NoticeVo notice);

    void deleteNotice(int id);


    NoticeVo getNoticeById(int id);

    void addNotice(NoticeVo notice);
}
