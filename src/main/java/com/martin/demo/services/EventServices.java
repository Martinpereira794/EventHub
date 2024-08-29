package com.martin.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.martin.demo.models.Event;
import com.martin.demo.repositories.EventRepository;
import com.martin.demo.repositories.MessageRepository;
import com.martin.demo.repositories.UserRepository;

@Service
public class EventServices {

	@Autowired
	private EventRepository er;
	
	@Autowired
	private MessageRepository mr;
	
	@Autowired
	private UserRepository ur;
	
	
	
	
	
}
