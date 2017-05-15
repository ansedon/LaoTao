package com.repository;


import com.model.ArticleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * Created by tciisxy on 2017/5/7.
 */
@Repository
public interface ArticleRepository extends JpaRepository<ArticleEntity,Integer> {

    List<ArticleEntity> readByArtAddrCityOrderByArtLikesNumDesc(String addrCity);

    List<ArticleEntity> readByArtAddrCityOrderByArtPostTimeDesc(String addrCity);

    List<ArticleEntity> findByArtAddrCityLike(String key);

    List<ArticleEntity> findByArtAddrProvinceLike(String key);

    List<ArticleEntity> findByArtTitleLike(String key);


}
