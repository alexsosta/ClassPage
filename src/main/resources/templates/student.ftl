<#import "parts/common.ftl" as c>

<@c.page>
<h1>${student.name?ifExists}</h1>
<h2>ID: ${student.id?ifExists}</h2>
<h2>Phone Number: ${student.phoneNumber?ifExists}</h2>
<h2>Email: ${student.eMail?ifExists}</h2>
<a href="/student">To students page</a>
<a href="/student/remove/${student.id}">remove</a>
<a href="/student/edit/${student.id}">edit</a>
<form action="/student" method="post">
    <select name="courseId">
        <option disabled>Choose course</option>
        <#list courses as course>
        <option value=${course.id?ifExists}>${course.course?ifExists}</option>
        <#else>
        Empty
    </#list>
    </select>
    <button type="submit">add course</button>
    <input type="hidden" name="studentId" value="${student.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
<table>
    <thead>
    <tr>
        <th>course</th>
        <th>start date</th>
        <th>end date</th>
        <th>days</th>
        <th>remove</th>
    </tr>
    </thead>
    <tbody>
    <#list student.courses as course>
    <tr>
        <td>${course.course?ifExists}</td>
        <td>${course.startDate?ifExists}</td>
        <td>${course.endDate?ifExists}</td>
        <td>${course.days?ifExists}</td>
        <td><a href="/student/${student.id}/${course.id}">remove</a></td>
    </tr>
    <#else>
    Empty
    </#list>
    </tbody>
</table>
</@c.page>