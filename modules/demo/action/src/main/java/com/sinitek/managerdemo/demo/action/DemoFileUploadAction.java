package com.sinitek.managerdemo.demo.action;

import org.directwebremoting.io.FileTransfer;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 文件上传范例
 */
public class DemoFileUploadAction {
    public static String upload(Map<String, String> param, Map<String, List<FileTransfer>> fileMap, HttpServletRequest request)
    {
        List<FileTransfer> files = fileMap.get("files");
        if (files != null && files.size() > 0) {
            FileTransfer file = files.get(0);
            return "上传文件:" + files.size() + "第一个文件："+file.getFilename();
        }
        return "没有上传";
    }
}