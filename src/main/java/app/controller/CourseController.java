package app.controller;

import app.entity.Course;
import app.entity.Student;
import app.repository.CourseRepository;
import app.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private StudentRepository studentRepository;

    @GetMapping
    public String courses(Model model){
        Iterable<Course> courses = courseRepository.findAll();
        HashMap coursesStudents = new HashMap();
        for (Course course: courses) {
            coursesStudents.put("key" + course.getId(), course.getStudents().size());
        }
        model.addAttribute("students",coursesStudents);
        model.addAttribute("courses",courses );
        return "courses";
    }

    @PostMapping
    public String addStudent(
            @RequestParam Long courseId,
            @RequestParam Long studentId
    ){
        Course course = courseRepository.findById(courseId).get();
        Student student = studentRepository.findById(studentId).get();
        course.getStudents().add(student);
        courseRepository.save(course);
        return "redirect:/course/" + courseId;
    }

    @GetMapping("{id}")
    public String CoursePage(
            @PathVariable Long id,
            Model model){
        Course course = courseRepository.findById(id).get();
        List<Student> students = studentRepository.findAll();
        students.removeAll(course.getStudents());
        model.addAttribute("course",course);
        model.addAttribute("students",students);
        return "course";
    }

    @GetMapping("/remove/{id}")
    public String removeCourse(
            @PathVariable Long id
            ){
        Course course = courseRepository.findById(id).get();
        courseRepository.delete(course);
        return "redirect:/course";
    }

    @GetMapping("/{courseId}/{studentId}")
    public String removeStudentFromCourse(
            @PathVariable Long courseId,
            @PathVariable Long studentId
            ){
        Course course = courseRepository.findById(courseId).get();
        course.getStudents().remove(studentRepository.findById(studentId).get());
        courseRepository.save(course);
        return "redirect:/course/" + courseId;
    }

    @GetMapping("/add")
    public String addCoursePage(){
        return "newcourse";
    }

    @PostMapping("/add")
    public String addCourse(
            @RequestParam String course,
            @RequestParam String startDate,
            @RequestParam String endDate,
            @RequestParam int days
    ) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        courseRepository.save(new Course(course, simpleDateFormat.parse(startDate), simpleDateFormat.parse(endDate), days));
        return "redirect:/course";
    }


}
