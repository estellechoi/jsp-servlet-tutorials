package com.youjin.daotest.dao;

// static import : 해당클래스의 객체들을 클래스 호출 없이 바로 사용할 수 있도록 하는 임포트
import static com.youjin.daotest.dao.RoleDaoSqls.DELETE_BY_ROLE_ID;
import static com.youjin.daotest.dao.RoleDaoSqls.SELECT_ALL;
import static com.youjin.daotest.dao.RoleDaoSqls.SELECT_BY_ROLE_ID;
import static com.youjin.daotest.dao.RoleDaoSqls.UPDATE;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.youjin.daotest.dto.Role;

@Repository // 빈으로 등록 (Repository : 저장소 역할을 하는 빈)
public class RoleDao {
	
	// 1) select, update 를 위한 객체들 
	// ? 가 포함된 쿼리문에서 이름을 이용하여 바인딩하고 결과값을 가져오는 역할을 하는 템플릿 객체
	private NamedParameterJdbcTemplate jdbc;
	
	// 2) insert 를 위한 객체
	// 쿼리문 없이 execute(params) 메소드만으로 파라미터 값을 데이터에 바로 넣어주는 객체
	private SimpleJdbcInsert insertAction;
	
	// 조회 결과를 한건씩 DTO 에 저장하기 위한 RowMapper 객체
	// BeanPropertyRowMapper 객체를 이용해서 데이터 컬럼의 값을 DTO의 변수에 자동으로 넣어준다.
	// DBMS의 문법(role_id) 과 Java의 문법(roleId) 을 자동으로 맞추어 값을 넣어준다.
	private RowMapper<Role> rowMapper = BeanPropertyRowMapper.newInstance(Role.class);
	
	
	
	// 생성자
	// RoleDao 객체 생성시, NamedParameterJdbcTemplate 과 SimpleJdbcInsert 객체를 생성하도록 한다.
	// spring 4.3 이상에서는 생성자가 없으면, 자동으로 객체를 주입함 ?
	public RoleDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		this.insertAction = new SimpleJdbcInsert(dataSource).withTableName("role");
	}
	
	
	// 쿼리문을 실행할 메소드들
	// jdbc.update(sql, params) : params 는 Map 객체로 넣어준다.
	
	// 1) select all 
	public List<Role> selectAll() {
		return jdbc.query(SELECT_ALL, Collections.emptyMap(), rowMapper);
		// Collections.emptyMap() : sql 문의 ? 에 바인딩할 값이 있을 때 바인딩할 값을 전달
		// rowMapper : 조회 결과를 한건씩 DTO 에 저장하는 목적으로 사용
		// jdbc.query() 는 한건씩 저장된 DTO 객체를 요소로하는 Map 반환		
	}
	
	// 2) insert
	public int insert(Role role) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(role);
		// Role 객체의 변수명을 데이터 컬럼명에 맞게 Map 객체로 만들어준다. (params)
		return insertAction.execute(params);
		// 조작된 레코드의 수를 반환한다. (int)
	}
	
	// 3) update
	public int update(Role role) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(role);
		// Role 객체의 변수명을 데이터 컬럼명에 맞게 Map 객체로 만들어준다. (params)
		return jdbc.update(UPDATE, params);
		// jdbc.update(sql, Map 데이터)
	}
	
	// 4) delete by role_id
	public int deleteById(Integer id) {
		Map<String, ?> params = Collections.singletonMap("roleId", id);
		// int, String 등의 값을 Role 객체의 변수에 넣어준다.
		// singletonMap 메소드는 값이 1 개일 때 사용한다.
		return jdbc.update(DELETE_BY_ROLE_ID, params);
		// jdbc.update(sql, Map 데이터)
	}
	
	// 5) select by role_id 
	public Role selectById(Integer id) {
		try {
			Map<String, ?> params = Collections.singletonMap("roleId", id);
			return jdbc.queryForObject(SELECT_BY_ROLE_ID, params, rowMapper); 
		}
		catch (EmptyResultDataAccessException e) {
			return null;
			// 조건에 맞는 데이터가 없는 경우, null 을 리턴하도록 한다.
		}
	}
	
}
