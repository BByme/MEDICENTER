package com.medicenter.repository;

import com.medicenter.model.Passenger;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(collectionResourceRel = "medicenter", path = "passenger")
public interface PassengerRepository extends PagingAndSortingRepository<Passenger, Long> {
}
