package com.repository;

import com.model.ReferEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by tciisxy on 2017/5/16.
 */
public interface ReferRepository extends JpaRepository<ReferEntity,Integer> {
    List<ReferEntity> findByReferArtIdIs(int art_id);
}
