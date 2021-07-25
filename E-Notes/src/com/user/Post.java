package com.user;
import java.util.Date;

public class Post {

private String title;
private String content;
private String pdate;
private UserDetails user;
public Post(String title, String content, String pdate, UserDetails user) {
	super();

	this.title = title;
	this.content = content;
	this.pdate = pdate;
	this.user = user;
}
public Post() {
	super();
	// TODO Auto-generated constructor stub
}

public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getPdate() {
	return pdate;
}
public void setPdate(String pdate) {
	this.pdate = pdate;
}
public UserDetails getUser() {
	return user;
}
public void setUser(UserDetails user) {
	this.user = user;
}



}
