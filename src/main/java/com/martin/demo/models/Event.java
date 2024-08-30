package com.martin.demo.models;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="events")
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Event name is required.")
	private String eventName;
	
	@DateTimeFormat(pattern = "HH:mm")
	@NotNull(message="Start time is required")	
	private LocalTime eventStartTime;
	
	@NotNull(message="End time is required")
	@DateTimeFormat(pattern = "HH:mm")
	private LocalTime eventEndTime;
	
	@Future //Fecha sea en el futuro
	@DateTimeFormat(pattern = "yyyy-MM-dd") // Cambia el patrón para que coincida con el input type="date"	
	@NotNull(message="Event date is required")
	private Date eventDate;
	
	@NotEmpty(message="Event Location is required.")
	private String eventLocation;
	
	@NotEmpty(message="Event Province is required.")
	private String eventProvince;
	
	@NotEmpty(message="Event info is required")
	private String eventInfo;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id") //Llave foránea
	private User host; //el User que creó el evento
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="users_join_events",
			joinColumns = @JoinColumn(name="event_id"),
			inverseJoinColumns = @JoinColumn(name="user_id")
			)
	private List<User> joinedUsers; //Los usuarios que se unieron al evento
	
	@OneToMany(mappedBy="event",fetch=FetchType.LAZY)
	private List<Message> eventMessages; //Mensajes del evento
	
	public Event() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public Date getEventDate() {
		return eventDate;
	}
	
	public String getFormattedEventDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(eventDate);
    }


	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventLocation() {
		return eventLocation;
	}

	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public String getEventProvince() {
		return eventProvince;
	}

	public void setEventProvince(String eventProvince) {
		this.eventProvince = eventProvince;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
		
	
	public LocalTime getEventStartTime() {
		return eventStartTime;
	}

	public void setEventStartTime(LocalTime eventStartTime) {
		this.eventStartTime = eventStartTime;
	}

	public LocalTime getEventEndTime() {
		return eventEndTime;
	}

	public void setEventEndTime(LocalTime eventEndTime) {
		this.eventEndTime = eventEndTime;
	}

	public String getEventInfo() {
		return eventInfo;
	}

	public void setEventInfo(String eventInfo) {
		this.eventInfo = eventInfo;
	}

	public User getHost() {
		return host;
	}

	public void setHost(User host) {
		this.host = host;
	}

	public List<User> getJoinedUsers() {
		return joinedUsers;
	}

	public void setJoinedUsers(List<User> joinedUsers) {
		this.joinedUsers = joinedUsers;
	}

	public List<Message> getEventMessages() {
		return eventMessages;
	}

	public void setEventMessages(List<Message> eventMessages) {
		this.eventMessages = eventMessages;
	}
	
	@Transient
    private MultipartFile eventImage;

    @Column(name="event_image_path")
    private String eventImagePath;

    // Getters y setters para el campo de imagen

    public MultipartFile getEventImage() {
        return eventImage;
    }

    public void setEventImage(MultipartFile eventImage) {
        this.eventImage = eventImage;
    }

    public String getEventImagePath() {
        return eventImagePath;
    }

    public void setEventImagePath(String eventImagePath) {
        this.eventImagePath =eventImagePath;

    }
    
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	
}
