<#import "parts/common.ftl" as c>

<@c.page>
<a href="/student/add">Add new student</a>
<a href="/">To main page</a>
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>FIO</th>
        <th>courses</th>
        <th>go over</th>
    </tr>
    </thead>
    <tbody>
    <#list students as student>
    <tr>
        <td>${student.id?ifExists}</td>
        <td>${student.name?ifExists}</td>
        <td>${courses["key" + student.id]}</td>
        <td><a href="/student/${student.id}">go over</a></td>
    </tr>
    <#else>
    Empty
    </#list>
    </tbody>
</table>
</@c.page>