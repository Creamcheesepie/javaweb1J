package javaweb1J.project.todayAttendMent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class TodayAttendMentDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	
	private String sql="";

	public int getTotalRecordCount() {
		int trc = 0;
		try {
			sql="select count(idx) as cnt from todayAttendMent";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) trc=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return trc;
	}

	public ArrayList<TodayAttendMentVO> getTodayAttendMentList(int stIndexNo, int pageSize) {
		ArrayList<TodayAttendMentVO> vos = new ArrayList<>();
		try {
			sql = "select *,"
					+ " (select nickName from member where idx=tam.midx)as aNickName,"
					+ " (select mid from member where idx=tam.midx)as aMid"
					+ " from todayAttendMent tam"
					+ " order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TodayAttendMentVO vo = new TodayAttendMentVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setArticle(rs.getString("article"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setaMid(rs.getString("aMid"));
				vo.setaNickName(rs.getString("aNickName"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		return vos;
	}

	public boolean getTAMWritedTodayByMidx(String midx,String strNow) {
		boolean res = false;
		
		try {
			sql="select * from todayAttendMent where midx = ? and date_format(wDate,'%Y-%m-%d')=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, midx);
			pstmt.setString(2, strNow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res=true;
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		return res;
	}

	public void setTodayAttendMentWrite(TodayAttendMentVO vo) {
		try {
			sql="insert into todayAttendMent values(default,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getmIdx());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getArticle());
			pstmt.setString(4, vo.getHostIp());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public boolean setTodayAttendMentChange(TodayAttendMentVO vo) {
		boolean check = false;
		try {
			sql = "update todayAttendMent set title=?, article=? where idx=? and midx=? ";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getArticle());
			pstmt.setInt(3, vo.getIdx());
			pstmt.setInt(4, vo.getmIdx());
			
			pstmt.executeUpdate();
			check=true;
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return check;

	}

	public String setTodayAttendMentDelete(int idx) {
		String res = "0";
		
		try {
			sql = "delete from todayAttendMent where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res="1";
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	
	
	
	
}
