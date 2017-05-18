package com.repository;

import com.model.ArtReportEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by ansedon on 2017/5/16.
 */
@Repository
public interface ArtReportRepository extends JpaRepository<ArtReportEntity,Integer>{
    ArtReportEntity findByRepUserIdAndRepArtId(int user_id,int art_id);
}
