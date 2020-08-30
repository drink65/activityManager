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
// ���� DiskFileItemFactory �ļ��������
		DiskFileItemFactory factory = new DiskFileItemFactory();
// ͨ�����������ȡ�ļ��ϴ�������Ľ����� ServletFileUpload 
		ServletFileUpload upload = new ServletFileUpload(factory);
		Map<String, String> parameterMap = new HashMap<String, String>();
		String filePath = null;
		InputStream in = null;
		OutputStream out = null;
		try {
// ʹ�� ServletFileUpload ��Ӧ Request ������н�
			RequestContext reqContext = new ServletRequestContext(req);
			List<FileItem> items = upload.parseRequest(reqContext);
// ����ÿ�� fileItem
			for (FileItem fileItem : items) {
// �ж� fileItem �Ƿ����ϴ���
// ͨ�� FileItem.isFormField()�����жϵ�ǰ����ͨ����ļ��� ���ز���ֵ��true����ͨ�false���ļ���
				if (fileItem.isFormField()) {
// ���� true:��ʾ�����ϴ���
					String fieldName = fileItem.getFieldName(); // ��ȡ��ͨ��� name����ֵ��

					String str = fileItem.getString("utf-8"); // ��ȡ��ͨ����ı�����
					parameterMap.put(fieldName, str);
				} else {
// ���� false:��ʾ���ϴ���
					String name = fileItem.getName(); // ��ȡ�ļ�����ϴ��ļ���

					in = fileItem.getInputStream(); // ��ȡ�ļ�����ϴ��ļ�������
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
