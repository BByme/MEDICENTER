package com.medicenter.repository;

import com.medicenter.model.NavSystem;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(collectionResourceRel = "medicenter", path = "nav_system")
public interface NavSystemRepository extends PagingAndSortingRepository<NavSystem, Long> {
}
