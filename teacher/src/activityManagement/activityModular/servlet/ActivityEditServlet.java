package activityManagement.activityModular.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;

import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import activityManagement.activityModular.dao.ActivityDao;
import activityManagement.activityModular.entity.Activity;

public class ActivityEditServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
// 创建 DiskFileItemFactory 文件项工厂对象
		DiskFileItemFactory factory = new DiskFileItemFactory();
// 通过工厂对象获取文件上传请求核心解析类 ServletFileUpload 
		ServletFileUpload upload = new ServletFileUpload(factory);
		Map<String, String> parameterMap = new HashMap<String, String>();
		String filePath = null;
		InputStream in = null;
		OutputStream out = null;
		try {
// 使用 ServletFileUpload 对应 Request 对象进行解
			RequestContext reqContext = new ServletRequestContext(req);
			List<FileItem> items = upload.parseRequest(reqContext);
// 遍历每个 fileItem
			for (FileItem fileItem : items) {
// 判断 fileItem 是否是上传项
// 通过 FileItem.isFormField()方法判断当前是普通项还是文件项 返回布尔值：true：普通项；false：文件项
				if (fileItem.isFormField()) {
// 返回 true:表示不是上传项
					String fieldName = fileItem.getFieldName(); // 获取普通项的 name属性值称

					String str = fileItem.getString("utf-8"); // 获取普通项的文本内容
					parameterMap.put(fieldName, str);
				} else {
// 返回 false:表示是上传项
					String name = fileItem.getName(); // 获取文件项的上传文件名

					in = fileItem.getInputStream(); // 获取文件项的上传文件输入流
					if (name != null && !"".equals(name)) {
						String doc = "/upload";
						String uploadPath = getServletContext().getRealPath(doc);
						System.out.println(uploadPath);
//						name="pic01.jpg";
//						uploadPath ="E:\\workspace";
						File uploadFile = new File(uploadPath, name);
						filePath = doc + "/" + name;
						System.out.println(filePath);
						out = new FileOutputStream(uploadFile);
						byte[] buf = new byte[1024];
						int len = 0;
						while ((len = in.read(buf)) != -1) {
							out.write(buf, 0, len);
						}
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
			if (out != null) {
				out.close();
			}
		}
		String actId = parameterMap.get("actId");
		String actName = parameterMap.get("actName");
		String sponsor = parameterMap.get("sponsor");
		String coOrganizer = parameterMap.get("coOrganizer");
		String signUpStart = parameterMap.get("signUpStart");
		String signUpEnd = parameterMap.get("signUpEnd");
		String actStart = parameterMap.get("actStart");
		String actEnd = parameterMap.get("actEnd");
		String actContent = parameterMap.get("actContent");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Activity activity = new Activity();
		ActivityDao activityDao = new ActivityDao();
		if (actId != null && !"".equals(actId)) {
			activity = activityDao.queryById(Integer.parseInt(actId));
		}
		activity.setActName(actName);
		activity.setSponsor(sponsor);
		activity.setCoOrganizer(coOrganizer);
		activity.setActContent(actContent);

		if (filePath != null) {
			activity.setActPicture(filePath);

		}
		try {

			if (signUpStart != null && !"".equals(signUpStart)) {
				activity.setSignUpStartDate(df.parse(signUpStart));

			}
			if (signUpEnd != null && !"".equals(signUpEnd)) {
				activity.setSignUpEndDate(df.parse(signUpEnd));
			}
			if (actStart != null && !"".equals(actStart)) {
				activity.setActStartDate(df.parse(actStart));
			}
			if (actEnd != null && !"".equals(actEnd)) {
				activity.setActEndDate(df.parse(actEnd));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Boolean isSuccess = activityDao.saveOrUpdate(activity);
		if (isSuccess) {
			resp.sendRedirect("/teacher/jsp/activityManagement.jsp");
		} else {
			req.getRequestDispatcher("/html/fail.html").forward(req, resp);
		}
	}
}
