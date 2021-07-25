package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.user.Post;


public class PostDao {
private Connection conn ;


public PostDao(Connection conn) {
	super();
	this.conn = conn;
}


public boolean addNotes(String title, String content, String id, String date){
	boolean f =false;
	try {
		String query = "insert into notes (title,content,userid,notedate) values(?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, title);
		ps.setString(2, content);
		ps.setString(3, id);
		ps.setString(4, date);
		int i =ps.executeUpdate();
		if(i==1)
		{
			f=true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}


	return f;
	
}
public List<Post> getData(String id){
	List<Post> list = new ArrayList<Post>();
	Post po=null;
	try{
		String query = "select * from notes where userid=? order by notedate desc";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			po=new Post(); 
			po.setTitle(rs.getString("title"));
			
			po.setContent(rs.getString("content"));

			po.setPdate(rs.getString("notedate"));
			list.add(po);
		}
		//Collections.reverse(list);
	}catch(SQLException sql){
		System.out.print("Some error occured : "+sql.getMessage());
	}
	
	return list;
}



public Post getDataById(String date){
	Post p=null;
	try {
		String query = "Select * from notes where notedate =?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, date);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			p= new Post();
			p.setPdate(rs.getString("notedate"));
			p.setTitle(rs.getString("title"));
			p.setContent(rs.getString("content"));
			
		}
	} catch (SQLException e) {

		e.printStackTrace();
	}
	return p;
}



public boolean updateNote(String date,String content,String title){
	boolean f =false;
	try {
		
		String query = "update notes set title =?,content=? where notedate=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, title);
		ps.setString(2, content);
		ps.setString(3, date);

		
		int result = ps.executeUpdate();
		if(result==1){
			return true;
			
		}
	} catch (SQLException e) {

		e.printStackTrace();
	}
	return f;
}

public boolean deleteNote(String date, String email){
	boolean f =false;
	try {
		
		String query = "delete from notes where userid=? and notedate=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, email);
		System.out.println(email);
		System.out.println(date);

		ps.setString(2, date);
		int result = ps.executeUpdate();
		if(result==1){
			return true;
		}
	} catch (SQLException e) {

		e.printStackTrace();
	}
	return f;
}

}
