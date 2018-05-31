package com.medicenter.repository;

import com.medicenter.model.Doctor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(collectionResourceRel = "medicenter", path = "doctor")
public interface DoctorRepository extends PagingAndSortingRepository<Doctor, Long> {
}
