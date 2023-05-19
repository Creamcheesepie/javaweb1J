package javaweb1J.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface projectInterface {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException; 
}
