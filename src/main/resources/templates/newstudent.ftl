<#import "parts/common.ftl" as c>

<@c.page>
<form action="/student/add" method="post">
    <label>FIO :</label>
    <input type="text" name="name" placeholder="Student name" />
    <label >Phone number:</label>
    <input type="text" name="phone" placeholder="Phone number" />
    <label >Email:</label>
    <input type="text" name="email" placeholder="Email" />
    <button type="submit">add</button>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</@c.page>