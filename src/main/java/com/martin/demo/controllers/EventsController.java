package com.martin.demo.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.martin.demo.models.Event;
import com.martin.demo.models.Message;
import com.martin.demo.models.Province;
import com.martin.demo.models.User;
import com.martin.demo.repositories.EventRepository;
import com.martin.demo.services.AppService;
import com.martin.demo.services.EventServices;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class EventsController {

    @Autowired
    private AppService serv;

    @Autowired
    private EventServices es;

    @Autowired
    private EventRepository er;

    @GetMapping("/")
    public String index(HttpSession session,Model model) {
    	List<Event> events = serv.getEventsOrderedByDate();
    	model.addAttribute("events", events);
        return "index.jsp";
    }

    @GetMapping("/home")
    public String home(HttpSession session,
                       @ModelAttribute("newEvent") Event newEvent,
                       Model model) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        User myUser = serv.getUser(userTemp.getId());
        model.addAttribute("user", myUser);

        List<Event> eventsNear = serv.getEventsInProvinceOrderedByDate(myUser.getProvince());
        model.addAttribute("eventsNear", eventsNear);

        List<Event> eventsNotNear = serv.getEventsNotInProvinceOrderedByDate(myUser.getProvince());
        model.addAttribute("eventsNotNear", eventsNotNear);

        model.addAttribute("provinces", Province.Provinces);

        return "home.jsp";
    }

    @PostMapping("/create_event")
    public String createEvent(HttpSession session,
                              @Valid @ModelAttribute("newEvent") Event newEvent,
                              BindingResult result,
                              Model model) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {
            User myUser = serv.getUser(userTemp.getId());
            model.addAttribute("user", myUser);

            List<Event> eventsNear = serv.getEventsInProvinceOrderedByDate(myUser.getProvince());

            model.addAttribute("eventsNear", eventsNear);

            List<Event> eventsNotNear = serv.getEventsNotInProvinceOrderedByDate(myUser.getProvince());

            model.addAttribute("eventsNotNear", eventsNotNear);

            model.addAttribute("provinces", Province.Provinces);

            return "home.jsp";
        } else {
            serv.saveEvent(newEvent);
            return "redirect:/home";
        }
    }

    @GetMapping("/join/{eventId}")
    public String joinEvent(@PathVariable("eventId") Long eventId,
                            HttpSession session) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        serv.joinEvent(userTemp.getId(), eventId);
        return "redirect:/home";
    }

    @GetMapping("/cancel/{eventId}")
    public String cancelEvent(@PathVariable("eventId") Long eventId,
                              HttpSession session) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        serv.cancelEvent(userTemp.getId(), eventId);
        return "redirect:/home";
    }
    
    

    @GetMapping("/event/{id}")
    public String viewEvent(@PathVariable("id") Long id,
                            HttpSession session,
                            Model model,
                            @ModelAttribute("message") Message message) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        Event event = serv.getEvent(id);
        model.addAttribute("event", event);

        return "event.jsp";
    }
    
    @GetMapping("/searchEventF")
    public String searchEventF(@RequestParam(value="eventName", required= false) String eventName,
                               HttpSession session, 
                               Model model) {
        // Si el usuario está en sesión, se utiliza esa información; de lo contrario, se ignora.
        User userTemp = (User) session.getAttribute("userInSession");

        List<Event> events;
        if (eventName == null || eventName.trim().isEmpty()) {
            // Obtener todos los eventos ordenados por fecha si no se proporciona un nombre de evento
            events = serv.getEventsOrderedByDate();
        } else {
            // Buscar eventos que contienen el nombre proporcionado, ignorando mayúsculas y minúsculas
            events = er.findByEventNameContainingIgnoreCase(eventName);
        }
        
        // Agregar los eventos encontrados al modelo para que puedan ser mostrados en index.jsp
        model.addAttribute("events", events);

        return "index.jsp";
    }



    @GetMapping("/searchEvent")
    public String searchEvent(@RequestParam(value="eventName", required= false) String eventName,
                              HttpSession session, 
                              Model model) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        User myUser = serv.getUser(userTemp.getId());
        String userProvince = myUser.getProvince();

        List<Event> events;
        
        
        if (eventName == null || eventName.trim().isEmpty()) {
            events = serv.getEventsInProvinceOrderedByDate(userProvince);
            List<Event> eventsNotNear = serv.getEventsNotInProvinceOrderedByDate(userProvince);
            model.addAttribute("eventsNotNear", eventsNotNear);
            model.addAttribute("eventsNear", events);
        } else {
            List<Event> allEvents = er.findByEventNameContainingIgnoreCase(eventName);

            List<Event> nearbyEvents = allEvents.stream()
                    .filter(event -> event.getEventProvince().equals(userProvince))
                    .collect(Collectors.toList());

            List<Event> otherEvents = allEvents.stream()
                    .filter(event -> !event.getEventProvince().equals(userProvince))
                    .collect(Collectors.toList());

            model.addAttribute("eventsNear", nearbyEvents);
            model.addAttribute("eventsNotNear", otherEvents);
        }

        model.addAttribute("provinces", Province.Provinces);
        return "home.jsp";
    }

    @PostMapping("/create_message")
    public String createMessage(@Valid @ModelAttribute("message") Message message,
                                BindingResult result,
                                HttpSession session,
                                Model model) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {
            model.addAttribute("event", message.getEvent());
            return "event.jsp";
        } else {
            serv.saveMessage(message);
            return "redirect:/event/" + message.getEvent().getId();
        }
    }

    @DeleteMapping("/event/delete/{id}")
    public String deleteEvent(@PathVariable("id") Long id, HttpSession session) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        serv.borrarEvento(id);
        return "redirect:/home";
    }

    @GetMapping("/event/edit/{id}")
    public String editEventForm(@PathVariable("id") Long id,
                                Model model,
                                HttpSession session) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        Event eventEdit = serv.getEvent(id);
        model.addAttribute("event", eventEdit);
        model.addAttribute("provinces", Province.Provinces);
        return "editEvent.jsp";
    }

    @PutMapping("/event/edit")
    public String editEvent(@Valid @ModelAttribute("event") Event event,
                            BindingResult result,
                            HttpSession session,
                            Model model) {
        User userTemp = (User) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {
            model.addAttribute("provinces", Province.Provinces);
            return "editEvent.jsp";
        } else {
            serv.saveEvent(event);
            return "redirect:/home";
        }
    }
}
