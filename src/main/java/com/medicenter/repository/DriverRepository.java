package com.medicenter.repository;

import com.medicenter.model.Driver;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "medicenter", path = "driver")
public interface DriverRepository extends PagingAndSortingRepository<Driver, Long> {

}
