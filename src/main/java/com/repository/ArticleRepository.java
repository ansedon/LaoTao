package com.repository;


import com.model.ArticleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * Created by tciisxy on 2017/5/7.
 */
@Repository
public interface ArticleRepository extends JpaRepository<ArticleEntity,Integer> {

    List<ArticleEntity> readByArtAddrCityOrderByArtLikesNumDesc(String addrCity);

    List<ArticleEntity> readByArtAddrCityOrderByArtPostTimeDesc(String addrCity);

    @Query("select article from ArticleEntity article order by article.artReadNum desc ")
    List<ArticleEntity> getArtOrderByArtReadNumDesc();

    @Query("select article from ArticleEntity article where article.artAddrCity=?1 order by article.artReadNum desc ")
    List<ArticleEntity> getArtByArtAddrCityOrderByArtReadNumDesc(String city);

    List<ArticleEntity> findByArtAddrCityLike(String key);

    List<ArticleEntity> findByArtAddrProvinceLike(String key);

    List<ArticleEntity> findByArtTitleLike(String key);

    ArticleEntity findByArtId(int artId);

    @Transactional
    @Modifying
    @Query("update ArticleEntity article set article.artReadNum=?1 where article.artId=?2")
    void setArtReadNum(int num,int artId);
}