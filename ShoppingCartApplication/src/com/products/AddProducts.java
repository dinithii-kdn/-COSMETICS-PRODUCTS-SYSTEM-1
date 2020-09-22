package com.products;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddProducts
 */
@WebServlet("/AddProducts")
public class AddProducts extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:\\Users\\DELL\\Documents\\NetBeansProjects\\ShoppingCartApplication\\build\\web\\uploads";
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName=request.getParameter("uploadLogo");
				String productName = request.getParameter("pname");
				String productQuantity = request.getParameter("quantity");
				String productPrice = request.getParameter("price");
				
				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));
						FileItem pName = (FileItem) multiparts.get(0);
						productName = pName.getString();
						FileItem quantity = (FileItem) multiparts.get(1);
						productQuantity = quantity.getString();
						FileItem price = (FileItem) multiparts.get(2);
						productPrice = price.getString();	
					}
				}
				try {
					int id = 0;
					String imagePath = UPLOAD_DIRECTORY + imageName;
					int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into products (product_name,product_quantity,product_price,image,image_path) values('" + productName + "','" + productQuantity + "','" + productPrice + "','" + imageName + "','" + imagePath + "')");
					if (i > 0) {
						String success = "Logo Uploaded Successfully.";
						session.setAttribute("message", success);
						response.sendRedirect("add-products.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}
}
