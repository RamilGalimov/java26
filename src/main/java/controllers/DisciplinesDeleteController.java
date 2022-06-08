package controllers;

import database.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplinesDeleteController", urlPatterns = "/discipline-delete")
public class DisciplinesDeleteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ids = req.getParameter("deleteHidden");
//        2  4  6  8
        String[] idsToDelete = ids.split(" ");

        DBManager manager = new DBManager();
        for (String id : idsToDelete) {
            manager.deleteDiscipline(id);
        }
        resp.sendRedirect("/disciplines");

    }
}
