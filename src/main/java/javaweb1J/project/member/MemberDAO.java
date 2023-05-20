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
	
	// 아이디를 기준으로 모든 데이터를 가져오는 메소드
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
			getConn.rsClose();
		}

		return vo;
	}
	
	//닉네임을 기준으로 모든 데이터를 가져오는 메소드
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
			getConn.rsClose();
		}

		return vo;
	}
	
	// 회원가입 메소드.
	public boolean setNewMemberData(MemberVO vo) {
		boolean check = false;
		try {
			sql = "insert into member values (default,?,?,?,?,?"
					+ ",?,?,?,?,?"
					+ ",?,?,?,?"
					+ ",default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getSalt());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getNickName());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getBirthday());
			pstmt.setInt(9, vo.getAge());
			pstmt.setString(10, vo.getGender());
			pstmt.setString(11, vo.getAddress());
			pstmt.setString(12, vo.getRideInfo());
			pstmt.setString(13, vo.getInst());
			pstmt.setString(14, vo.getPhoto());
			pstmt.executeUpdate();
			check = true;
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return check;
	}
	
	public void setTodayLoginUpdate(int idx) {
		try {
			sql="update member set todayCnt=todayCnt+1,lastVisit=now() where idx=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}


	public void setInitializationTodayCnt(int idx) {
		try {
			sql="update member set totCnt=totCnt+1,todayCnt=0 where idx=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
	
	
	
	
}
