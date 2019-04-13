package app.controller;

import app.entity.Course;
import app.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {
    @Autowired
    private CourseRepository courseRepository;

    @GetMapping
    public String main(Model model){
        List<Course> courses = courseRepository.findAll();
        List<Course> pastCourses = new ArrayList<>();
        List<Course> futureCourses = new ArrayList<>();
        List<Course> presentCourses = new ArrayList<>();
        Date today = new Date();
        HashMap coursesStudents = new HashMap();
        for (Course course: courses){
            coursesStudents.put("key" + course.getId(), course.getStudents().size());
            if (today.after(course.getEndDate())) pastCourses.add(course);
            else if (today.before(course.getStartDate())) futureCourses.add(course);
            else presentCourses.add(course);
        }
        model.addAttribute("pastCourses", pastCourses);
        model.addAttribute("futureCourses", futureCourses);
        model.addAttribute("presentCourses", presentCourses);
        model.addAttribute("students", coursesStudents);
        return "main";
    }
}
