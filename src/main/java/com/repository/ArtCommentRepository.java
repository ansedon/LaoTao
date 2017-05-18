package com.repository;

import com.model.ArtCommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by tciisxy on 2017/5/7.
 */
public interface ArtCommentRepository extends JpaRepository<ArtCommentEntity,Integer> {
    List<ArtCommentEntity>findByComArtIdOrderByArtComTime(int comArtId);
    ArtCommentEntity findByComArtIdAndCommentatorId(int art_id,int user_id);
    List<ArtCommentEntity> findByComArtIdIs(int ComArtId);
}
