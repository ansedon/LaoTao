package com.service;

import com.model.*;
import com.repository.*;
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
    private Map<String, String> map=new HashMap<>();

    public List<ArticleEntity> findArticleOnHot()
    {
        articleEntityList=articleRepository.getArtOrderByArtReadNumDesc();
        return articleEntityList;
    }

    public List<ArticleEntity>findArticleByCityOrderByReadNum(String city)
    {
        articleEntityList=articleRepository.getArtByArtAddrCityOrderByArtReadNumDesc(city);
        return articleEntityList;
    }

    public ArticleEntity findArticleByArtId(int artId)
    {
        return articleRepository.findByArtId(artId);
    }

    public List<ArtCommentEntity> findArtComByArtId(int artId)
    {
        return artCommentRepository.findByComArtIdOrderByArtComTime(artId);
    }

    public void updateArtReadNum(int artId)
    {
        int num=articleRepository.findByArtId(artId).getArtReadNum()+1;
        articleRepository.setArtReadNum(num,artId);
    }

    public ArtAgreeEntity findArtAgree(int userId,int artId)
    {
        return artAgreeRepository.findByAgreeUserIdAndAgreeArtId(userId,artId);
    }

    public ArtLikeEntity findArtLike(int userId,int artId)
    {
        return artLikeRepository.findByLikerIdAndLikeArtId(userId,artId);
    }

    public ArtCommentEntity findArtComment(int userId,int artId)
    {
        return artCommentRepository.findByComArtIdAndCommentatorId(artId,userId);
    }

    public ArtReportEntity findArtReport(int userId,int artId)
    {
        return artReportRepository.findByRepUserIdAndRepArtId(userId,artId);
    }

    public List<ReferEntity> findArtReferRes(int artId)
    {
        return referRepository.findByReferArtIdIs(artId);
    }
}
