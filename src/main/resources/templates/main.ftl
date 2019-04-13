<#import "parts/common.ftl" as c>
<@c.page>
<h1>MAIN PAGE</h1>
<a href="/course">COURSES</a>
<a href="/student">STUDENTS</a>
<h3>Present Courses</h3>
<table>
    <thead>
    <tr>
        <th>course</th>
        <th>students</th>
    </tr>
    </thead>
    <tbody>
    <#list presentCourses as presentCourse>
    <tr>
        <td>${presentCourse.course?ifExists}</td>
        <td>${students["key" + presentCourse.id]}</td>
    </tr>
    <#else>
    Empty
    </#list>
    </tbody>
</table><h3>Future Courses</h3>
<table>
    <thead>
    <tr>
        <th>course</th>
        <th>students</th>
    </tr>
    </thead>
    <tbody>
    <#list futureCourses as futureCourse>
    <tr>
        <td>${futureCourse.course?ifExists}</td>
        <td>${students["key" + futureCourse.id]}</td>
    </tr>
    <#else>
    Empty
    </#list>
    </tbody>
</table>
<h3>Past Courses</h3>
<table>
    <thead>
    <tr>
        <th>course</th>
        <th>students</th>
    </tr>
    </thead>
    <tbody>
    <#list pastCourses as pastCourse>
    <tr>
        <td>${pastCourse.course?ifExists}</td>
        <td>${students["key" + pastCourse.id]}</td>
    </tr>
    <#else>
    Empty
    </#list>
    </tbody>
</table>
</@c.page>