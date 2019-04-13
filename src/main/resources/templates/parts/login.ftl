<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <label>User Name :</label>
    <input type="text" name="username" placeholder="User name" />
    <label >Password:</label>
    <input type="password" name="password" placeholder="Password" />
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
<button type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit">Sign Out</button>
</form>
</#macro>