package com.repository;


import com.model.ArticleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by tciisxy on 2017/5/7.
 */
public interface ArticleRepository extends JpaRepository<ArticleEntity,Integer> {
}
