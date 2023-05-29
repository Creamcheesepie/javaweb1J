package javaweb1J.project.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MessageDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";

	public int getMessageTotalRecordCount(int sMIdx) {
		int trc = 0;
		try {
			sql="select count(idx) as cnt from message where rIDx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sMIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) trc=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return trc;
		
	}

	public ArrayList<MessageVO> getMessageList(int sMIdx, int stIndexNo, int pageSize) {
		ArrayList<MessageVO> vos = new ArrayList<>();
		
		try {
			sql = "select "
					+ "		m.*,"
					+ "		s.mid,s.nickName,s.Name,s.email"
					+ " from"
					+ "			message m,"
					+ "			member s"
					+ "	 where	m.rIdx=?"
					+ "	 and		m.sIdx=s.Idx"
					+ " order by idx desc"
					+ " limit ?,?";
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, sMIdx);
			pstmt.setInt(2, stIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageVO vo = new MessageVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setsIdx(rs.getInt("sIdx"));
				vo.setrIdx(rs.getInt("rIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setsDate(rs.getString("sDate"));
				vo.setrDate(rs.getString("rDate"));
				vo.setMessageType(rs.getInt("messageType"));
				vo.setrCheck(rs.getInt("rCheck"));
				vo.setsMid(rs.getString("mid"));
				vo.setsNickName(rs.getString("nickName"));
				vo.setsEmail(rs.getString("email"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("messagList SQl error" + e.getMessage());
		}	finally {
			getConn.rsClose();
		}
		return vos;
	}

	public void setSendMessage(MessageVO vo) {
		try {
			sql="insert into message values(default,?,?,?,?,default,null,null,?)";
			pstmt  = conn.prepareStatement(sql);
			pstmt.setInt(1,vo.getsIdx());
			pstmt.setInt(2, vo.getrIdx());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setInt(5, vo.getMessageType());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("쪽지 전송부 sql 에러 : " + e.getMessage());
		}	finally {
			getConn.pstmtClose();
		}

	}

	public ArrayList<MessageVO> getSendMessageList(int sMIdx, int stIndexNo, int pageSize) {
		ArrayList<MessageVO> vos = new ArrayList<>();
		
		try {
			sql = "select "
					+ "		m.*,"
					+ "		s.mid,s.nickName,s.Name,s.email"
					+ " from"
					+ "			message m,"
					+ "			member s"
					+ "	 where	m.rIdx=s.Idx"
					+ "	 and		m.sIdx=?"
					+ " order by idx desc"
					+ " limit ?,?";
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, sMIdx);
			pstmt.setInt(2, stIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageVO vo = new MessageVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setsIdx(rs.getInt("sIdx"));
				vo.setrIdx(rs.getInt("rIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setsDate(rs.getString("sDate"));
				vo.setrDate(rs.getString("rDate"));
				vo.setMessageType(rs.getInt("messageType"));
				vo.setrCheck(rs.getInt("rCheck"));
				vo.setsMid(rs.getString("mid"));
				vo.setsNickName(rs.getString("nickName"));
				vo.setsEmail(rs.getString("email"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("messagList SQl error" + e.getMessage());
		}	finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	
}
