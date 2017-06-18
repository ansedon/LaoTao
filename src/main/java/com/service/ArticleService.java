package com.service;

import com.model.*;
import com.repository.*;
import com.tool.GetDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ansedon on 2017/5/15.
 */
@Service
public class ArticleService {
    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    ArtCommentRepository artCommentRepository;
    @Autowired
    ArtAgreeRepository artAgreeRepository;
    @Autowired
    ArtLikeRepository artLikeRepository;
    @Autowired
    ArtReportRepository artReportRepository;
    @Autowired
    ReferRepository referRepository;
    List<ArticleEntity> articleEntityList;
    private Map<String, String> map = new HashMap<>();

    public List<ArticleEntity> findArticleOnHot() {
        articleEntityList = articleRepository.getArtOrderByArtReadNumDesc();
        return articleEntityList;
    }

    public List<ArticleEntity> findArticleByCityOrderByReadNum(String city) {
        articleEntityList = articleRepository.getArtByArtAddrCityOrderByArtReadNumDesc(city);
        return articleEntityList;
    }

    public ArticleEntity findArticleByArtId(int artId) {
        return articleRepository.findByArtId(artId);
    }

    public List<ArtCommentEntity> findArtComByArtId(int artId) {
        return artCommentRepository.findByComArtIdOrderByArtComTimeDesc(artId);
    }

    public void updateArtReadNum(int artId) {
        int num = articleRepository.findByArtId(artId).getArtReadNum() + 1;
        articleRepository.setArtReadNum(num, artId);
    }

    public ArtAgreeEntity findArtAgree(int userId, int artId) {
        return artAgreeRepository.findByAgreeUserIdAndAgreeArtId(userId, artId);
    }

    public ArtLikeEntity findArtLike(int userId, int artId) {
        return artLikeRepository.findByLikerIdAndLikeArtId(userId, artId);
    }

    public ArtCommentEntity findArtComment(int userId, int artId) {
        return artCommentRepository.findByComArtIdAndCommentatorId(artId, userId);
    }

    public ArtReportEntity findArtReport(int userId, int artId) {
        return artReportRepository.findByRepUserIdAndRepArtId(userId, artId);
    }

    public List<ReferEntity> findArtReferRes(int artId) {
        return referRepository.findByReferArtIdIs(artId);
    }

    public Map<String, String> agreeOrNot(int userId, int artId) {
        ArtAgreeEntity artAgreeEntity = artAgreeRepository.findByAgreeUserIdAndAgreeArtId(userId, artId);
        if (artAgreeEntity == null) {
            artAgreeEntity=new ArtAgreeEntity();
            artAgreeEntity.setAgreeUserId(userId);
            artAgreeEntity.setAgreeArtId(artId);
            artAgreeRepository.saveAndFlush(artAgreeEntity);
            map.put("msg", "点赞成功");
        } else {
            artAgreeRepository.delete(artAgreeEntity);
            map.put("msg", "已取消赞");
        }
        return map;
    }

    public Map<String, String> collectOrNot(int userId, int artId) {
        ArtLikeEntity artLikeEntity = artLikeRepository.findByLikerIdAndLikeArtId(userId, artId);
        if (artLikeEntity == null) {
            artLikeEntity=new ArtLikeEntity();
            artLikeEntity.setLikerId(userId);
            artLikeEntity.setLikeArtId(artId);
            artLikeRepository.saveAndFlush(artLikeEntity);
            map.put("msg", "收藏成功");
        } else {
            artLikeRepository.delete(artLikeEntity);
            map.put("msg", "已取消收藏");
        }
        return map;
    }

    public Map<String, String> reportOrNot(int userId, int artId) {
        ArtReportEntity artReportEntity = artReportRepository.findByRepUserIdAndRepArtId(userId, artId);
        if (artReportEntity == null) {
            artReportEntity=new ArtReportEntity();
            artReportEntity.setRepUserId(userId);
            artReportEntity.setRepArtId(artId);
            GetDate getTime = new GetDate();
            java.sql.Date time = null;
            time = getTime.getNetworkTime("http://www.baidu.com");
            if (time == null)
                time = new java.sql.Date(new java.util.Date().getTime());
            artReportEntity.setRepTime(time);
            artReportRepository.saveAndFlush(artReportEntity);
            map.put("msg", "举报成功");
        } else {
            artReportRepository.delete(artReportEntity);
            map.put("msg", "已取消举报");
        }
        return map;
    }
}
