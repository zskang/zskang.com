package com.framework.utils;

/**
 * 常量
 */
public class Constant {
	public static String MSG_COMMON="你好！您有一个A件,标题是：C，需要在B前办理完毕，请登陆亳州市教育局移动办公平台客户端或原办公平台查看详细内容！";
	public static String MSG="你好！您有一个A件,需要在B前办理完毕，请登陆亳州市教育局移动办公平台客户端或原办公平台查看详细内容！";
	public static String MSG_TODAY="你好！您有一个A件, 标题是：C，需要在今天办理完毕，如未在APP中填写办理情况，将扣除效能分。";
	/**
	 * 菜单类型
	 * @author R & D
	 * @email 908350381@qq.com
	 * @date 2016年11月15日 下午1:24:29
	 */
	public enum MenuType {
		/**
		 * 目录
		 */
		CATALOG(0),
		/**
		 * 菜单
		 */
		MENU(1),
		/**
		 * 按钮
		 */
		BUTTON(2);

		private int value;

		private MenuType(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}

	/**
	 * 定时任务状态
	 * @author R & D
	 * @email 908350381@qq.com
	 * @date 2016年12月3日 上午12:07:22
	 */
	public enum ScheduleStatus {
		/**
		 * 正常
		 */
		NORMAL(0),
		/**
		 * 暂停
		 */
		PAUSE(1);

		private int value;

		private ScheduleStatus(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}

	//极光
	public static final String MASTERSECRET="d35751794993f5d508374200";
	public static final String APPKEY="9ad839357dbb3a7485f2e45b";
}
