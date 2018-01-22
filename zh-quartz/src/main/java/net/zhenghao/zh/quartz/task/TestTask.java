package net.zhenghao.zh.quartz.task;

import org.springframework.stereotype.Component;

/**
 * 测试任务
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月22日 上午11:00:57
 * TestTask.java
 */
@Component("tastTask")
public class TestTask {

	/**
	 * 测试定时任务方法
	 */
	public void test() {
		System.out.println("current timestapmp is : " + System.currentTimeMillis());
	}
}
