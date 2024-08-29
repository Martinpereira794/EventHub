package com.martin.demo.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.martin.demo.models.Event;
import com.martin.demo.models.Message;
import com.martin.demo.models.User;
import com.martin.demo.repositories.EventRepository;
import com.martin.demo.repositories.MessageRepository;
import com.martin.demo.repositories.UserRepository;

@Service
public class AppService {

	@Autowired
	private EventRepository er;
	
	@Autowired
	private MessageRepository mr;
	
	@Autowired
	private UserRepository ur;
	
	public User register(User newUser, BindingResult result) {
		String password = newUser.getPassword();
		String confirm = newUser.getConfirm();
		if(!password.equals(confirm)) {
			result.rejectValue("confirm", "Matches", "Password and confirmation dont match");
		}
		
		//Revisar que el email no este registrado
		String email = newUser.getEmail();
		
		User userExist = ur.findByEmail(email); //Objeto de User o null
		if(userExist != null) {
			//El correo ya esta registrado
			result.rejectValue("email", "Unique", "E-mail already exists");
		}
		
		//Si existe error, regreso null
		if(result.hasErrors()) {
			return null;
		}else {
			//No hay errores
			//Hashear contraseña
			String passHash = BCrypt.hashpw(password, BCrypt.gensalt());
			newUser.setPassword(passHash); //Establecemos el password hasheado
			return ur.save(newUser);
		}
	}
	
	/*Método que revisa que los datos sean correctos para Iniciar Sesión*/
	public User login(String email, String password) {
		//Revisamos que el correo exista en BD
		User userTryingLogin = ur.findByEmail(email); //Objeto User o NULL
		
		if(userTryingLogin == null) {
			return null;
		}
		
		//Comparar las contraseñas
		//BCrypt.checkpw(Contra NO encriptada, Contra SI encriptada) -> True o False
		if(BCrypt.checkpw(password, userTryingLogin.getPassword())) {
			return userTryingLogin;
		} else {
			return null;
		}						
	}
	
    public List<Event> getEventsOrderedByDate() {
        return er.findAllByOrderByEventDateAsc();
    }

	
	public Event saveEvent(Event newEvent) {
		return er.save(newEvent);
	}
	
	/* Método que en base a un id nos regresa un objeto de User */
	public User getUser(Long id) {
		return ur.findById(id).orElse(null);
	}
	
	public List<Event> getEvents(){
		return er.findAll();
	}
	
	 public List<Event> getEventsInProvinceOrderedByDate(String province) {
	        return er.findByEventProvinceOrderByEventDateAsc(province);
	    }

	    public List<Event> getEventsNotInProvinceOrderedByDate(String province) {
	        return er.findByEventProvinceIsNotOrderByEventDateAsc(province);
	    }
	
	public Event getEvent(Long id) {
		return er.findById(id).orElse(null);
	}
	
	//Metodo que une un usuario a un evento// 
	
	public void joinEvent(Long userId, Long eventId) {
		User myUser = getUser(userId);
		Event myEvent = getEvent(eventId);
		
		myEvent.getJoinedUsers().add(myUser);
		er.save(myEvent);
	}
	
	public void cancelEvent(Long userId, Long eventId) {
		User myUser = getUser(userId);
		Event myEvent = getEvent(eventId);
		
		myEvent.getJoinedUsers().remove(myUser);
		er.save(myEvent);
	}
	
	//Metodo que guarde mensajes
	
	public Message saveMessage(Message newMessage) {
		return mr.save(newMessage);
	}
	
	public void borrarEvento(Long id) {
		Event myEvent = getEvent(id);
		List<Message> messages = myEvent.getEventMessages();
		mr.deleteAll(messages);
		er.deleteById(id);
	}
}
