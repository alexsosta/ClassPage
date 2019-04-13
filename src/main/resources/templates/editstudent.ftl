<#import "parts/common.ftl" as c>

<@c.page>
<form action="/student/edit" method="post">
    <label>FIO :</label>
    <input type="text" name="name" placeholder="Student name" value="${student.name}"/>
    <label >Phone number:</label>
    <input type="text" name="phone" placeholder="Phone number" value="${student.phoneNumber}"/>
    <label >Email:</label>
    <input type="text" name="email" placeholder="Email" value="${student.eMail}"/>
    <button type="submit">update</button>
    <input type="hidden" name="id" value="${student.id}" />
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</@c.page>