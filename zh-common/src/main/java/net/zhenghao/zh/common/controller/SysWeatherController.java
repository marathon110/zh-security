package net.zhenghao.zh.common.controller;


import net.zhenghao.zh.common.utils.HttpClientUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 获取天气api
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月19日 上午10:49:00
 * SysWeatherController.java
 */
@RestController
@RequestMapping("/sys/weather")
public class SysWeatherController extends AbstractController {

	@RequestMapping("/info")
	public String getWeather(String city) throws IOException {
		String url = "https://way.jd.com/he/freeweather";
		Map<String, Object> params = new HashMap<>();
		params.put("city", city);
		params.put("appkey", "48859a77003b3dd43bf92f86b467ac22");
		return HttpClientUtils.sendPost(url, params);
	}
}
