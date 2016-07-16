package com.sinitek.managerdemo.demo.service.handler;

import org.springframework.jdbc.core.JdbcTemplate;

public interface IDemoService {
    public JdbcTemplate getJdbcTemplate();
}
