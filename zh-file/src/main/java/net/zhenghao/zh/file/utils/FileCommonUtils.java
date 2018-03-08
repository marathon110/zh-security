package net.zhenghao.zh.file.utils;

import java.text.DecimalFormat;

import net.zhenghao.zh.common.constant.SystemConstant;

/**
 * 文件通用工具类
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月9日 上午11:23:25
 * FileCommonUtils.java
 */
public class FileCommonUtils {

	/**
	 * 根据文件名判断文件类型
	 * @param fileName
	 * @return 图片：1     文档：2     视频：3    种子：4    音乐：5   其他：6
	 */
	public static Integer fileType(String fileName) {
		
		if (fileName == null) {
			fileName = "文件名为空！";
			return null;
		} else {
			// 获取文件后缀名并转化为写，用于后续比较
			String fileType = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
			// 创建图片类型数组
			String img[] = { "bmp", "jpg", "jpeg", "png", "tiff", "gif", "pcx", "tga", "exif", "fpx", "svg", "psd",
			"cdr", "pcd", "dxf", "ufo", "eps", "ai", "raw", "wmf" };
			for (int i = 0; i < img.length; i++) {
				if (img[i].equals(fileType)) {
					return SystemConstant.FileType.IMAGE.getValue();
				}
			}
			
			// 创建文档类型数组
			String document[] = { "txt", "doc", "docx", "xls", "htm", "html", "jsp", "rtf", "wpd", "pdf", "ppt" };
			for (int i = 0; i < document.length; i++) {
				if (document[i].equals(fileType)) {
					return SystemConstant.FileType.DOCUMENT.getValue();
				}
			}
			
			// 创建视频类型数组
			String video[] = { "mp4", "avi", "mov", "wmv", "asf", "navi", "3gp", "mkv", "f4v", "rmvb", "webm" };
			for (int i = 0; i < video.length; i++) {
				if (video[i].equals(fileType)) {
					return SystemConstant.FileType.VIDEO.getValue();
				}
			}
			
			// 创建音乐类型数组
			String music[] = { "mp3", "wma", "wav", "mod", "ra", "cd", "md", "asf", "aac", "vqf", "ape", "mid", "ogg",
			"m4a", "vqf" };
				for (int i = 0; i < music.length; i++) {
				if (music[i].equals(fileType)) {
					return SystemConstant.FileType.MUSIC.getValue();
				}
			}
				
			// 创建种子类型数组
			String seed[] = { "torrent" };
				for (int i = 0; i < seed.length; i++) {
				if (seed[i].equals(fileType)) {
					return SystemConstant.FileType.SEED.getValue();
				}
			}
		}
		return SystemConstant.FileType.OTHER.getValue();
	}
	
	/**
	 * 根据size得到格式化的文件大小(String)
	 * @param size
	 * @return
	 */
	public static String getSizeFormat(long size) {
		StringBuffer bytes = new StringBuffer();
		DecimalFormat format = new DecimalFormat("###.0");
		if (size >= 1024 * 1024 * 1024) {
			double i = (size / (1024.0 * 1024.0 * 1024.0));
			bytes.append(format.format(i)).append("GB");
		} else if (size >= 1024 * 1024) {
			double i = (size / (1024.0 * 1024.0));
			bytes.append(format.format(i)).append("MB");
		} else if (size >= 1024) {
			double i = (size / (1024.0));
			bytes.append(format.format(i)).append("KB");
		} else if (size < 1024) {
			if (size <= 0) {
				bytes.append("0B");
			} else {
				bytes.append(size).append("B");
			}
		}
		return bytes.toString();
	}
	
}
