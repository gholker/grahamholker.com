<#include "header.ftl">

	<#include "menu.ftl">
	
	<div class="page-header">
		<h2><#escape x as x?xml>${content.title}</#escape></h2>
	</div>

	<p>${content.body}</p>
	
	<hr />

	<p><em>${content.date?string("dd MMMM yyyy")}</em></p>

<#include "footer.ftl">