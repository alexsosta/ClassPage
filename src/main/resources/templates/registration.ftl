<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<a>Add new user</a>
${message?ifExists}
<@l.login "/registration" true />
</@c.page>