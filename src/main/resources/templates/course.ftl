<#import "parts/common.ftl" as c>

<@c.page>
<h1>${course.course?ifExists}</h1>
<h2>Start course: ${course.startDate?ifExists}</h2>
<h2>End course: ${course.endDate?ifExists}</h2>
<h2>Number of days: ${course.days?ifExists}</h2>
<a href="/course">To courses page</a>
<a href="/course/remove/${course.id}">remove</a>
<form action="/course" method="post">
    <select name="studentId">
        <option disabled>Choose student</option>
        <#list students as student>
        <option value=${student.id?ifExists}>${student.name?ifExists}</option>
        <#else>
        Empty
        </#list>
    </select>
    <button type="submit">add student</button>
    <input type="hidden" name="courseId" value="${course.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
<table>
    <thead>
    <tr>
        <th>FIO</th>
        <th>email</th>
        <th>phone number</th>
        <th>remove</th>
    </tr>
    </thead>
    <tbody>
    <#list course.students as student>
    <tr>
        <td>${student.name?ifExists}</td>
        <td>${student.eMail?ifExists}</td>
        <td>${student.phoneNumber?ifExists}</td>
        <td><a href="/course/${course.id}/${student.id}">remove</a></td>
    </tr>
    <#else>
    Empty
    </#list>
    </tbody>
</table>
</@c.page>