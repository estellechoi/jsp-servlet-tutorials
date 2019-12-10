package com.youjin.guestbook.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.youjin.guestbook.dto.Log;

@Repository
public class LogDao {
	private NamedParameterJdbcTemplate template;
	private SimpleJdbcInsert insertAction;
	
	// 생성자
	public LogDao(DataSource dataSource) {
		// jdbc template 객체 생성
		this.template = new NamedParameterJdbcTemplate(dataSource);
		// SimpleJdbcInsert 객체 생성
		this.insertAction = new SimpleJdbcInsert(dataSource).withTableName("log").usingGeneratedKeyColumns("id");
	}
	
	public Long insert(Log log) {
		SqlParameterSource paramMap = new BeanPropertySqlParameterSource(log);
		// BeanPropertySqlParameterSource(Object) : 객체의 변수들을 DB 컬럼명에 맞추어 Map 타입 데이터를 반환한다.
		return insertAction.executeAndReturnKey(paramMap).longValue();
		// executeAndReturnKey() : insert 문을 내부적으로 만들어 실행하고, 자동생성된 id 값을 리턴한다.
	}
}
