<#import "parts/common.ftl" as c>

<@c.page>
<form action="/course/add" method="post">
    <label>Course :</label>
    <input type="text" name="course" placeholder="Course name" />
    <label >Start date:</label>
    <input type="date" name="startDate">
    <label >End date:</label>
    <input type="date" name="endDate">
    <label>Days :</label>
    <input type="text" name="days" placeholder="number" />
    <button type="submit">add</button>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</@c.page>