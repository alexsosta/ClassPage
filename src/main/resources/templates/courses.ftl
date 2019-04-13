<#import "parts/common.ftl" as c>

<@c.page>
<a href="/course/add">Add new course</a>
<a href="/">To main page</a>
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>course</th>
        <th>start date</th>
        <th>end date</th>
        <th>days</th>
        <th>students</th>
        <th>to course</th>
    </tr>
    </thead>
    <tbody>
    <#list courses as course>
    <tr>
        <td>${course.id?ifExists}</td>
        <td>${course.course?ifExists}</td>
        <td>${course.startDate?ifExists}</td>
        <td>${course.endDate?ifExists}</td>
        <td>${course.days?ifExists}</td>
        <td>${students["key" + course.id]}</td>
        <td><a href="/course/${course.id}">go over</a></td>
    </tr>
    <#else>
    Empty
    </#list>
    </tbody>
</table>
</@c.page>