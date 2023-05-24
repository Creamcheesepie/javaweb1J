package javaweb1J.project.gethering;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class GetheringDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	
	private String sql="";

	public int getTotalRecordCount() {
		int trc = 0;
		try {
			sql="select count(idx) as cnt from gethering";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) trc=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return trc; 
	}

	public ArrayList<GetheringVO> getGetheringList(int stIndexNo, int pageSize) {
		ArrayList<GetheringVO> vos = new ArrayList<>();
		try {
			sql = "select * ,"
					+ " (select nickName from member where idx=g.midx) as aNickName,"
					+ " (select mid from member where idx=g.midx)as aMid,"
					+ " (select name from member where idx=g.midx)as aName"
					+ " from gethering g"
					+ "	order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GetheringVO vo = new GetheringVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setGetheringType(rs.getString("getheringType"));
				vo.setLocation(rs.getString("location"));
				vo.setTotalGetherMember(rs.getInt("totalGetherMember"));
				vo.setGetherJoinMember(rs.getInt("getherJoinMember"));
				vo.setGpxFileName(rs.getString("gpxFileName"));
				vo.setDistance(rs.getInt("distance"));
				vo.setGetHeight(rs.getInt("getHeight"));
				vo.setDetailCourse(rs.getString("detailCourse"));
				vo.setGetherTime(rs.getString("getherTime"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setaNickName(rs.getString("aNickName"));
				vo.setaMid(rs.getString("aMid"));
				vo.setaName(rs.getString("aName"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vos;
	}

	public boolean setGetheringInsert(GetheringVO vo) {
		boolean check = false;
		
		try {
			sql="insert into gethering values(default,"
					+ " ?,?,?,?,?,"
					+ " ?,?,?,?,?,"
					+ " ?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getmIdx());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getGetheringType());
			pstmt.setString(5, vo.getLocation());
			pstmt.setInt(6, vo.getTotalGetherMember());
			pstmt.setInt(7, vo.getGetherJoinMember());
			pstmt.setString(8, vo.getGpxFileName());
			pstmt.setInt(9, vo.getDistance());
			pstmt.setInt(10, vo.getGetHeight());
			pstmt.setString(11, vo.getDetailCourse());
			pstmt.setString(12, vo.getGetherTime());
			pstmt.setString(13, vo.getHostIp());
			pstmt.executeUpdate();
			check = true;
			
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return check;
	}
	
	
}
