package com.repository;

import com.model.ArtLikeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by ansedon on 2017/5/16.
 */
@Repository
public interface ArtLikeRepository extends JpaRepository<ArtLikeEntity,Integer> {
    ArtLikeEntity findByLikerIdAndLikeArtId(int liker_id,int art_id);
}
