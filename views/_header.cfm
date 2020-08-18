<cfoutput>
<div class="header">
	<div class="container">
		<cfif cb.themeSetting( 'headerLogo' ) is "">
			<div class="navbar-brand-crv"><a href="#cb.linkHome()#" class="navbar-brand scroll-top" title="#cb.siteTagLine()#" data-toggle="tooltip">#cb.siteName()#</a></div>
		<cfelse>
			<div class="navbar-brand-crv"><a href="#cb.linkHome()#" class="navbar-brand scroll-top" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" class="img-fluid"></a></div>
		</cfif>
		

		<nav class="navbar navbar-expand-lg navbar-dark justify-content-center navbar-inverse" id="header-main">
			<button class="navbar-toggler navbar-toggle" type="button" data-toggle="collapse" data-target="##mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<!--- Generate Menu --->
			<div class="collapse navbar-collapse justify-content-center" id="mainNav">
				<ul class="navbar-nav">
					<cfset menuData = cb.rootMenu( type="data", levels="2" )>
					<!--- Iterate and build pages --->
					<cfloop array="#menuData#" index="menuItem">
						<cfif structKeyExists( menuItem, "subPageMenu" )>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <i class="fa fa-chevron-down"></i></a>
								#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
							</li>
						<cfelse>
							<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
								<li class="nav-item active">
							<cfelseif cb.isHomePage() AND menuItem.title eq 'Home'>
								<li class="nav-item active">
							<cfelse>
								<li class="nav-item">
							</cfif>
								<a class="nav-link" href="#menuItem.link#">#menuItem.title#</a>
							</li>
						</cfif>
					</cfloop>

					<!--- Blog Link, verify active --->
					<cfif ( !prc.cbSettings.cb_site_disable_blog )>
						<cfif cb.isBlogView()><li class="nav-item active"><cfelse><li></cfif>
							<a class="nav-link" href="#cb.linkBlog()#">Blog</a>
						</li>
					</cfif>
				</ul>
			</div>
		</nav>
	</div>
</div>

<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu">';

	// Parent
	menu &= '<li class="nav-item"><a class="nav-link dropdown-item" href="#parentLink#">#parentTitle#</a></li>';

	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li class="nav-item"><a class="nav-link dropdown-item" href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="nav-item dropdown-submenu"><a href="#menuItem.link#" class="nav-link dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>