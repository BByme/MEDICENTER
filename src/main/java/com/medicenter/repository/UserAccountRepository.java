package com.medicenter.repository;

import com.medicenter.model.UserAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(collectionResourceRel = "medicenter", path = "user_account")
public interface UserAccountRepository extends PagingAndSortingRepository<UserAccount, Long> {

}
