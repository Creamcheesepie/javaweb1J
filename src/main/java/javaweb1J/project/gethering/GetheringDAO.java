package javaweb1J.project.gethering;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import javaweb1J.project.admin.AdminVO;

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

	public ArrayList<GetheringVO> getGetheringList(int stIndexNo, int pageSize,int sMIdx) {
		ArrayList<GetheringVO> vos = new ArrayList<>();
		try {
			sql = "select * ,"
					+ " (select nickName from member where idx=g.midx) as aNickName,"
					+ " (select mid from member where idx=g.midx)as aMid,"
					+ " (select name from member where idx=g.midx)as aName,"
					+ " (select mIdx from getherJoinMember where gIdx=g.idx and mIdx=? ) as joined "
					+ " from gethering g"
					+ "	order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sMIdx);
			pstmt.setInt(2, stIndexNo);
			pstmt.setInt(3, pageSize);
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
				vo.setJoined(rs.getInt("joined"));
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

	public GetheringVO getTotalgetherMember(int gIdx) {
		GetheringVO vo = new GetheringVO();
		
		try {
			sql="select * from gethering where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, gIdx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setTotalGetherMember(rs.getInt("totalGetherMember"));
				vo.setGetherJoinMember(rs.getInt("getherJoinMember"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vo;
	}

	public GetheringJoinMemberVO getGetheringJoinMemberBygIdxmIdx(int gIdx, int mIdx) {
		GetheringJoinMemberVO vo = new GetheringJoinMemberVO();
		
		try {
			sql="select*from getherJoinMember where gIdx=? and mIdx=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, gIdx);
			pstmt.setInt(2, mIdx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setgIdx(rs.getInt("gIdx"));
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setjDate(rs.getString("jDate"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
				
		return vo;
	}

	public void setGetheringJoinMemberDeleteBygIdxmIdx(int gIdx, int mIdx) {
		try {
			sql="delete from getherJoinMember where gIdx=? and mIdx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, gIdx);
			pstmt.setInt(2, mIdx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public void setGetheringJoinMemberInsertBygIdxmIdx(int gIdx, int mIdx) {
		try {
			sql="insert into getherJoinMember values(default,?,?,default)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, gIdx);
			pstmt.setInt(2, mIdx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public void setGetheringJoinMemeberUpsdate(int gIdx, int i) {
		try {
			sql = "update gethering set getherJoinMember=getherJoinMember+? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setInt(2, gIdx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류3 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public ArrayList<GetheringJoinMemberVO> getGetheringJoinMemberList(int gIdx) {
		ArrayList<GetheringJoinMemberVO> vos = new ArrayList<>();
		try {
			sql = "select * ,"
					+ " (select nickName from member where idx=gj.midx) as jNickName,"
					+ " (select mid from member where idx=gj.midx)as jMid,"
					+ " (select name from member where idx=gj.midx)as jName"
					+ " from getherJoinMember gj where gIdx=? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gIdx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GetheringJoinMemberVO vo = new GetheringJoinMemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setgIdx(rs.getInt("gIdx"));
				vo.setjDate(rs.getString("jDate"));
				vo.setjName(rs.getString("jName"));
				vo.setjNickName(rs.getString("jNickName"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류3 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		

		return vos;
	}

	public ArrayList<GetheringVO> getMyGetheringList(int stIndexNo, int pageSize, int sMIdx) {
		ArrayList<GetheringVO> vos = new ArrayList<>();
		try {
			sql = "select * ,"
					+ " (select nickName from member where idx=g.midx) as aNickName,"
					+ " (select mid from member where idx=g.midx)as aMid,"
					+ " (select name from member where idx=g.midx)as aName,"
					+ " (select mIdx from getherJoinMember where gIdx=g.idx and mIdx=? ) as joined "
					+ " from gethering g"
					+ " where midx=? "
					+ "	order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sMIdx);
			pstmt.setInt(2, sMIdx);
			pstmt.setInt(3, stIndexNo);
			pstmt.setInt(4, pageSize);
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
				vo.setJoined(rs.getInt("joined"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vos;
	}

	public void setGetheringUpdate(GetheringVO vo) {
		try {
			sql = "update gethering set location=?, distance=?,getHeight=?,detailCourse=?  where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getLocation());
			pstmt.setInt(2, vo.getDistance());
			pstmt.setInt(3, vo.getGetHeight());
			pstmt.setString(4, vo.getDetailCourse());
			pstmt.setInt(5, vo.getIdx());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류3 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public void setGetheringDelete(int idx) {
		try {
			sql="delete from gethering where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류3 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public void setGetheringMemberDelete(int idx) {
		try {
			sql="delete from getherJoinMember where gIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류3 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public AdminVO getAdminGInfoCnt() {
		AdminVO vo = new AdminVO();
		try {
			sql="select count(idx) as tgCnt, "
					+ " (select count(idx) from gethering where getherTime >= date_add(now(),interval -30 day) and getherTime <= date_add(now(),interval 0 day)) as mgCnt,"
					+ " (select count(idx) from gethering where getherTime >= date_add(now(),interval -7 day) and getherTime <= date_add(now(),interval 0 day)) as wgCnt, "
					+ " (select count(idx) from gethering where getherTime <= date_add(now(),interval 30 day) and getherTime >= date_add(now(),interval 0 day))  as nmgCnt,"
					+ " (select count(idx) from gethering where getherTime <= date_add(now(),interval 7 day)  and getherTime >= date_add(now(),interval 0 day))  as nwgCnt "
					+ " from gethering";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setTgCnt(rs.getInt("tgCnt"));
				vo.setMgCnt(rs.getInt("mgCnt"));
				vo.setWgCnt(rs.getInt("wgCnt"));
				vo.setNmgCnt(rs.getInt("nmgCnt"));
				vo.setNwgCnt(rs.getInt("nwgCnt"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 오류3 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	public ArrayList<GetheringVO> getAdminGetheringList() {
		ArrayList<GetheringVO> vos = new ArrayList<>();
		try {
			sql = "select * ,"
					+ " (select nickName from member where idx=g.midx) as aNickName,"
					+ " (select mid from member where idx=g.midx)as aMid,"
					+ " (select name from member where idx=g.midx)as aName"
					+ " from gethering g"
					+ "	where getherTime = date_add(now(),interval 0 day) "
					+ " order by idx desc limit 0,5";
			pstmt = conn.prepareStatement(sql);

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
				vo.setJoined(rs.getInt("joined"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류19 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vos;

	}

}
