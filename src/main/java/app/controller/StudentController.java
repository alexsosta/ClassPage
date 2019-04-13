package app.controller;

import app.entity.Course;
import app.entity.Student;;
import app.repository.CourseRepository;
import app.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private CourseRepository courseRepository;

    @GetMapping
    public String students(Model model){
        Iterable<Student> students = studentRepository.findAll();
        HashMap studentCourses = new HashMap();
        for (Student student: students) {
            String courses = "";
            for (Course course : student.getCourses()) courses += course.getCourse() + "; ";
            studentCourses.put("key" + student.getId(), courses);
        }
        model.addAttribute("courses", studentCourses);
        model.addAttribute("students", students);
        return "students";
    }

    @PostMapping
    public String addCourse(
            @RequestParam Long courseId,
            @RequestParam Long studentId
    ){
        Course course = courseRepository.findById(courseId).get();
        Student student = studentRepository.findById(studentId).get();
        student.getCourses().add(course);
        studentRepository.save(student);
        return "redirect:/student/" + studentId;
    }

    @GetMapping("{id}")
    public String StudentPage(
            @PathVariable Long id,
            Model model){
        Student student = studentRepository.findById(id).get();
        List<Course> courses = courseRepository.findAll();
        courses.removeAll(student.getCourses());
        model.addAttribute("courses",courses);
        model.addAttribute("student",student);
        return "student";
    }

    @GetMapping("/edit/{id}")
    public String editStudentPage(
            @PathVariable Long id,
            Model model
    ){
        Student student = studentRepository.findById(id).get();
        model.addAttribute("student",student);
        return "/editstudent";
    }

    @PostMapping("/edit")
    public String editStudent(
            @RequestParam Long id,
            @RequestParam String name,
            @RequestParam String phone,
            @RequestParam String email
    ){
        Student student = studentRepository.findById(id).get();
        student.setName(name);
        student.setPhoneNumber(phone);
        student.seteMail(email);
        studentRepository.save(student);
        return "redirect:/student/" + id;
    }

    @GetMapping("/remove/{id}")
    public String removeStudent(
            @PathVariable Long id
            ){
        Student student = studentRepository.findById(id).get();
        studentRepository.delete(student);
        return "redirect:/student";
    }

    @GetMapping("{studentId}/{courseId}")
    public String removeFromCourse(
            @PathVariable Long studentId,
            @PathVariable Long courseId
    ){
        Student student = studentRepository.findById(studentId).get();
        student.getCourses().remove(courseRepository.findById(courseId).get());
        studentRepository.save(student);
        return "redirect:/student/" + studentId;
    }

    @GetMapping("/add")
    public String addStudentPage(){
        return "newstudent";
    }

    @PostMapping("/add")
    public String addStudent(
            @RequestParam String name,
            @RequestParam String phone,
            @RequestParam String email
    ){
        studentRepository.save(new Student(name, phone, email));
        return "redirect:/student";
    }


}