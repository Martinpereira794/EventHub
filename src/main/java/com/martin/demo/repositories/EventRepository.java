package com.martin.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.martin.demo.models.Event;

@Repository
public interface EventRepository extends CrudRepository<Event, Long>{
	
	// SELECT * FROM events WHERE province = <Provincia Enviada> ORDER BY eventDate ASC
	List<Event> findByEventProvinceOrderByEventDateAsc(String province);

	
	// SELECT * FROM events WHERE province != <Provincia Enviada> ORDER BY eventDate ASC
	List<Event> findByEventProvinceIsNotOrderByEventDateAsc(String province);
	
	@Query("SELECT e FROM Event e WHERE e.eventName LIKE %:eventName%")
    List<Event> findByEventNameContainingIgnoreCase(@Param("eventName") String eventName);

	List<Event> findAll();
	
    List<Event> findAllByOrderByEventDateAsc();

}

