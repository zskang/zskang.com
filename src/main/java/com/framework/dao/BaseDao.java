package com.framework.dao;

import java.util.List;
import java.util.Map;

/**
 * 基础Dao(还需在XML文件里，有对应的SQL语句)
 */
public interface BaseDao<T> {
	/**
	 * 保存实体对象
	 */
	void save(T t);

	/**
	 * 保存Map对象
	 */
	void save(Map<String, Object> map);

	/**
	 * 批量保存对象列表
	 */
	void saveBatch(List<T> list);

	/**
	 * 更新实体对象
	 */
	int update(T t);

	/**
	 * 更新Map对象
	 */
	int update(Map<String, Object> map);

	/**
	 * 根据对象ID删除对象
	 */
	int delete(Object id);

	/**
	 * 根据Map删除对象
	 */
	int delete(Map<String, Object> map);

	/**
	 * 根据对象ID数组批量删除对象
	 */
	int deleteBatch(Object[] id);

	/**
	 * 根据对象ID查询对象
	 */
	T queryObject(Object id);

	/**
	 * 根据Map查询对象列表
	 */
	List<T> queryList4kz(Map<String, Object> map);
	List<T> queryList4ld(Map<String, Object> map);

	/**
	 * 根据对象ID查询对象列表
	 */
	List<T> queryList(Object id);

	/**
	 * 根据Map查询对象总数
	 */
	int queryTotal(Map<String, Object> map);

	/**
	 * 查询对象总数
	 */
	int queryTotal();
}
