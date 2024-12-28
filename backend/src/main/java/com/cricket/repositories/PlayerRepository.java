package com.cricket.repositories;

import com.cricket.entities.PlayerEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlayerRepository extends JpaRepository<PlayerEntity, Long> {

    List<PlayerEntity> findByIdGreaterThan(Integer skip, Pageable pageable);
}
