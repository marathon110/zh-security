package net.zhenghao.zh.file.utils;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import net.zhenghao.zh.common.entity.R;
import net.zhenghao.zh.common.utils.DateUtils;
import net.zhenghao.zh.common.utils.PropertiesUtils;
import net.zhenghao.zh.common.utils.RedisUtils;
import net.zhenghao.zh.common.utils.ShiroUtils;
import net.zhenghao.zh.file.entity.SysUploadEntity;

/**
 * 文件上传工具类
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年2月8日 下午3:11:03
 * UploadUtils.java
 */
public class UploadUtils {
	
	/**
	 * 上传文件地址
	 */
	private static String save_path = PropertiesUtils.getInstance("upload").get("save_path");
	
	/**
	 * 上传分片文件
	 * @param request
	 * @throws IOException
	 */
	public static void uploadChunk(HttpServletRequest request) throws IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
		
		//当前登陆用户信息
		Long userId = ShiroUtils.getUserId();
		
		//文件上传的临时文件保存在temp文件夹下 定时删除"E:/zh_work/upload/用户id/temp/"
		String tempPath = new File(save_path) + File.separator 
				+ userId + File.separator
				+ "temp" + File.separator;
		
		String chunk = null;
		String fileName = null;
		
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				//上传文件的真实名称
				fileName = item.getName();
				if (item.isFormField()) {
					String fieldName = item.getFieldName();
					if ("chunk".equals(fieldName)) {
						chunk = item.getString("utf-8");
					}
				} else {
					File file = new File(tempPath + File.separator + RedisUtils.get("fileName_" + userId + "_" + fileName));
					if (!file.exists()) {
						file.mkdirs();
					}
					File chunkFile = new File(tempPath + File.separator + RedisUtils.get("fileName_" + userId + "_" + fileName)
					 + File.separator + chunk);
					FileUtils.copyInputStreamToFile(item.getInputStream(), chunkFile);
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断当前分片文件是否上传成功
	 * @param upload
	 * @return 1：成功  0：未成功
	 */
	public static R checkChunk(SysUploadEntity upload) {
		
		//当前登陆用户信息
		Long userId = ShiroUtils.getUserId();
		
		//文件上传的临时文件保存在temp文件夹下 定时删除"E:/zh_work/upload/用户id/temp/"
		String tempPath = new File(save_path) + File.separator 
				+ userId + File.separator
				+ "temp" + File.separator;
		
		//将当前进度条存入redis
        RedisUtils.set("progress_" + userId + "_" + upload.getFileName(), upload.getProgress());
        
        //将最后上传时间以字符串形式存入redis  
        RedisUtils.set("lastUploadTime_" + userId + "_" + upload.getFileName(), DateUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
        
        //自定义文件名： 时间戳（13位）  
        String tempFileName= String.valueOf(System.currentTimeMillis());  
        
        if (StringUtils.isBlank(RedisUtils.get("fileName_" + userId + "_" + upload.getFileName()))) {
        	//将文件名与该文件上传时生成的存储分片的临时文件夹的名称存入redis  
            //文件上传时生成的存储分片的临时文件夹的名称由MD5和时间戳组成 
        	//说明之前没有上传过，则创建上传信息
			RedisUtils.set("fileName_" + userId + "_" + upload.getFileName(), upload.getFileMd5() + tempFileName);
		}
        
        File checkFile = new File(tempPath + File.separator + RedisUtils.get("fileName_" + userId + "_" + upload.getFileName()) + File.separator + upload.getChunk()); 
        
        R result = new R();
        //检查文件是否存在，且大小是否一致  
        if(checkFile.exists() && checkFile.length()==Integer.parseInt(upload.getChunkSize())){    
            //上传过 
        	result.put("ifExist", 1);   
        }else{    
            //没有上传过    
        	result.put("ifExist", 0);  
        }
        return result;
	}
	
	/**
	 * 合并分片文件
	 * @param fileName
	 * @return
	 * @throws FileNotFoundException 
	 */
	@SuppressWarnings("resource")
	public static R mergeChunks(String fileName) throws FileNotFoundException {
		//当前登陆用户信息
		Long userId = ShiroUtils.getUserId();
		String commonName = userId + "_" + fileName;
		
		//文件上传的临时文件保存在temp文件夹下 定时删除"E:/zh_work/upload/用户id/temp/"
		String tempPath = new File(save_path) + File.separator 
				+ userId + File.separator
				+ "temp" + File.separator;
		//读取目录里的所有文件
		File f = new File(tempPath + File.separator + RedisUtils.get("fileName_" + commonName));
		
		File[] fileArray = f.listFiles(new FileFilter() {
			//排除目录只要文件
			@Override
			public boolean accept(File pathname) {
				if (pathname.isDirectory()) {
					return false;
				}
				return true;
			}
		});
		
		//转成集合，便于排序
		List<File> fileList = new ArrayList<File>(Arrays.asList(fileArray));
		Collections.sort(fileList, new Comparator<File>() {

			@Override
			public int compare(File o1, File o2) {
				if(Integer.parseInt(o1.getName()) < Integer.parseInt(o2.getName())){    
                    return -1;    
                }    
                return 1; 
			}
			
		});
		//截取文件名的后缀名
		int pointIndex = fileName.lastIndexOf(".");
		String suffix = fileName.substring(pointIndex);
		File saveFile = new File(save_path + File.separator //正式保存的文件夹
				+ userId + File.separator + DateUtils.formatDate() + File.separator);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		//合并后的文件
		File outputFile = new File(save_path + File.separator + userId + File.separator + DateUtils.formatDate()
			+ File.separator + RedisUtils.get("fileName_" + commonName) + suffix);
		//创建文件
		try {
			outputFile.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//输出流
		FileChannel outChannel = new FileOutputStream(outputFile).getChannel();
		//合并
		FileChannel inChannel;
		for (File file : fileList) {
			inChannel = new FileInputStream(file).getChannel();
			try {
				inChannel.transferTo(0, inChannel.size(), outChannel);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				inChannel.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//删除分片
			file.delete();
		}
		try {
			outChannel.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//清除文件夹
		File tempFile = new File(tempPath + File.separator + RedisUtils.get("fileName_" + commonName));
		if (tempFile.isDirectory() && tempFile.exists()) {
			tempFile.delete();
		}
		
		R result = new R();
		//将文件的最后上传时间和生成的文件名返回  
		result.put("lastUploadTime", RedisUtils.get("lastUploadTime_" + commonName));  
		result.put("pathFileName", RedisUtils.get("fileName_" + commonName) + suffix); 
		
		/****************清除redis中的相关信息**********************/ 
		//合并成功后删除redis中的进度信息
		RedisUtils.remove("progress_" + commonName);
		//合并成功后删除redis中的最后上传时间，只存没上传完成的  
		RedisUtils.remove("lastUploadTime_" + commonName);
		//合并成功后删除文件名称与该文件上传时生成的存储分片的临时文件夹的名称在redis中的信息
		//key：上传文件的真实名称   value：存储分片的临时文件夹名称（由上传文件的MD5值+时间戳组成） 
		//如果下次再上传同名文件  redis中将存储新的临时文件夹名称  没有上传完成的还要保留在redis中 直到定时任务生效  
		RedisUtils.remove("fileName_" + commonName);
		return result;
	}
}
