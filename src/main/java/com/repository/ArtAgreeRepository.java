package com.repository;

import com.model.ArtAgreeEntity;
import com.model.ArtAgreeEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by ansedon on 2017/5/16.
 */
@Repository
public interface ArtAgreeRepository extends JpaRepository<ArtAgreeEntity,Integer>{
    ArtAgreeEntity findByAgreeUserIdAndAgreeArtId(int agreer_id,int art_id);
}
