package com.sinitek.managerdemo.demo.service.handler;

import org.springframework.jdbc.core.JdbcTemplate;

public class DemoService implements IDemoService
{
    private static IDemoService instance;

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    /**
     * 私有构造函数
     */
    private DemoService() {
    }

    /**
     * 获得类实例，单例模式
     *
     * @return 类实例
     */
    public static IDemoService getInstance() {
        if (instance == null) {
            instance = new DemoService();
        }
        return instance;
    }
}

