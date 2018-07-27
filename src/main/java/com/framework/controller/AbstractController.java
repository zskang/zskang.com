package com.framework.controller;

import com.framework.entity.SysUserEntity;
import com.framework.utils.LoggerUtil;
import com.framework.utils.ShiroUtils;

/**
 * Controller公共组件
 */
public abstract class AbstractController {
	LoggerUtil logger=new LoggerUtil();

	protected SysUserEntity getUser() {
		return ShiroUtils.getUserEntity();
	}

	protected Long getUserId() {
		return getUser().getUserId();
	}
}
