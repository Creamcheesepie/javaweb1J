package javaweb1J.project.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";

	public MemberVO getMidCheckAllInfo(String mid) {
		MemberVO vo = new MemberVO();
		
		try {
			sql = "select * from member where mid =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setSalt(rs.getString("salt"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAge(rs.getInt("Age"));
				vo.setGender(rs.getString("gender"));
				
				vo.setAddress(rs.getString("address"));
				vo.setRideInfo(rs.getString("rideinfo"));
				vo.setInst(rs.getString("inst"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				
				vo.setTotCnt(rs.getInt("totCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSignInDate(rs.getString("signInDate"));
				vo.setLastVisit(rs.getString("lastVisit"));
				vo.setMemberDel(rs.getString("memberDel"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}

		return vo;
	}

	public MemberVO getNickNameCheckAllInfo(String nickName) {
MemberVO vo = new MemberVO();
		
		try {
			sql = "select * from member where nickName =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setSalt(rs.getString("salt"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAge(rs.getInt("Age"));
				vo.setGender(rs.getString("gender"));
				
				vo.setAddress(rs.getString("address"));
				vo.setRideInfo(rs.getString("rideinfo"));
				vo.setInst(rs.getString("inst"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				
				vo.setTotCnt(rs.getInt("totCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSignInDate(rs.getString("signInDate"));
				vo.setLastVisit(rs.getString("lastVisit"));
				vo.setMemberDel(rs.getString("memberDel"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}

		return vo;
	}
	
	
	
	
}
