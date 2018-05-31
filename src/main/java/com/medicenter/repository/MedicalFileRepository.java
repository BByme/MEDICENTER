package com.medicenter.repository;

import com.medicenter.model.MedicalFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(collectionResourceRel = "medicenter", path = "medical_file")
public interface MedicalFileRepository extends PagingAndSortingRepository<MedicalFile, Long> {
}
