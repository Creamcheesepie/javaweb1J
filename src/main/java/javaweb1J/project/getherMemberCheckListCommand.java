package javaweb1J.project;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javaweb1J.project.gethering.GetheringDAO;
import javaweb1J.project.gethering.GetheringJoinMemberVO;

public class getherMemberCheckListCommand implements ProjectInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gIdx = request.getParameter("gIdx")==null?0:Integer.parseInt(request.getParameter("gIdx"));
		
		GetheringJoinMemberVO gjvo = new GetheringJoinMemberVO();
		GetheringDAO dao = new GetheringDAO();
		
		ArrayList<GetheringJoinMemberVO> gjvos = dao.getGetheringJoinMemberList(gIdx); 
		
		JSONArray jarray =  new JSONArray();

		for (int i = 0; i<gjvos.size();i++) {
			JSONObject Jobj = new JSONObject();
			Jobj.put("idx", gjvos.get(i).getIdx());
			Jobj.put("mIdx", gjvos.get(i).getmIdx());
			Jobj.put("gIdx", gjvos.get(i).getgIdx());
			Jobj.put("jDate", gjvos.get(i).getjDate());
			Jobj.put("jName", gjvos.get(i).getjName());
			Jobj.put("jNickName", gjvos.get(i).getjNickName());
			jarray.add(Jobj);
			
		}

		String str = jarray.toJSONString();
		response.getWriter().write(str);

	}
}
