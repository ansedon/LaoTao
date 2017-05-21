package com.repository;

import com.model.ResMarkEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by yinjiaming on 17/5/18.
 */
@Repository
public interface ResMarkRepository extends JpaRepository<ResMarkEntity,Integer> {
    List<ResMarkEntity> findByMresId(int resId);
    ResMarkEntity findByMarkerIdAndMresId(int MarkerId, int resId);
}
