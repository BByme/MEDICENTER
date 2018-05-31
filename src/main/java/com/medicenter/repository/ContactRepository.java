package com.medicenter.repository;

import com.medicenter.model.Contact;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "medicenter", path = "contacts")
public interface ContactRepository extends PagingAndSortingRepository<Contact, Long> {

    List<Contact> findAllByPrenom(@Param("prenom") String prenom);
}
