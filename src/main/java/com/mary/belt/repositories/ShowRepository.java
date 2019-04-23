package com.mary.belt.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mary.belt.models.Show;


@Repository
public interface ShowRepository extends CrudRepository<Show, Long> {

}
