package com.martin.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.martin.demo.models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long> {

	
}
