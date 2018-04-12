package net.zhenghao.zh.tools.controller;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import net.zhenghao.zh.tools.entity.SysQrcodeEntity;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 🙃
 * 🙃生成二维码Controller
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/8 16:33
 * SysQrCodeController.java
 */
@Controller
@RequestMapping("/sys/qrcode")
public class SysQrCodeController {

    /**
     * 生成二维码
     * @content 二维码内容
     * @return
     */
    @RequestMapping("/create")
    public void createQrcode(SysQrcodeEntity qrcode, HttpServletResponse response) throws IOException {
        if (StringUtils.isNotBlank(qrcode.getContent())) {
            ServletOutputStream stream = null;
            try {
                stream = response.getOutputStream();
                QRCodeWriter writer = new QRCodeWriter();
                BitMatrix m = writer.encode(qrcode.getContent(), BarcodeFormat.QR_CODE, qrcode.getHeight(), qrcode.getWidth());
                MatrixToImageWriter.writeToStream(m, qrcode.getFormat(), stream);
            } catch (WriterException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (stream != null) {
                    stream.flush();
                    stream.close();
                }
            }
        }
    }

}
